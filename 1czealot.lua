
SMODS.Joker{ --Cult Zealot
    key = "1czealot",
    config = {
        extra = {
            specvar = 0
        }
    },
    loc_txt = {
        ['name'] = 'Cult Zealot',
        ['text'] = {
            [1] = 'After using {C:inactive}#1#/{}{C:attention}2{} {C:spectral}Spectral{} cards',
            [2] = '{C:red}Self destruct{} and create a',
            [3] = 'random {C:attention}Cult Joker{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["nx_nx_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.specvar}}
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  then
            if (context.consumeable and context.consumeable.ability.set == 'Spectral' and to_big((card.ability.extra.specvar or 0)) ~= to_big(1)) then
                return {
                    func = function()
                        card.ability.extra.specvar = (card.ability.extra.specvar) + 1
                        return true
                    end
                }
            elseif (context.consumeable and context.consumeable.ability.set == 'Spectral' and to_big((card.ability.extra.specvar or 0)) == to_big(1)) then
                return {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end,
                    extra = {
                        func = function()
                            
                            local created_joker = false
                            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                                created_joker = true
                                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        local joker_card = SMODS.add_card({ set = 'nx_cult' })
                                        if joker_card then
                                            
                                            
                                        end
                                        G.GAME.joker_buffer = 0
                                        return true
                                    end
                                }))
                            end
                            if created_joker then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                            end
                            return true
                        end,
                        colour = G.C.BLUE
                    }
                }
            end
        end
    end
}