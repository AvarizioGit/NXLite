
SMODS.Joker{ --Cult Fatesayer
    key = "2cfatesayer",
    config = {
        extra = {
            tarotvar = 0,
            multvar = 0
        }
    },
    loc_txt = {
        ['name'] = 'Cult Fatesayer',
        ['text'] = {
            [1] = 'Creates a {C:spectral}Spectral{} card and gain',
            [2] = '{C:red}+6{} Mult every {C:attention}4{} {C:tarot}Tarot{} cards used',
            [3] = '{C:inactive}(Currently{} {C:attention}#1#{}{C:inactive}/4 uses and{} {C:red}+#2#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["nx_nx_jokers"] = true, ["nx_cult"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.tarotvar, card.ability.extra.multvar}}
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  then
            if (context.consumeable and context.consumeable.ability.set == 'Tarot' and to_big((card.ability.extra.tarotvar or 0)) ~= to_big(3)) then
                return {
                    func = function()
                        card.ability.extra.tarotvar = (card.ability.extra.tarotvar) + 1
                        return true
                    end
                }
            elseif (context.consumeable and context.consumeable.ability.set == 'Tarot' and to_big((card.ability.extra.tarotvar or 0)) == to_big(3)) then
                return {
                    func = function()
                        card.ability.extra.tarotvar = 1
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.multvar = (card.ability.extra.multvar) + 6
                            return true
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                                
                                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                                    G.E_MANAGER:add_event(Event({
                                        trigger = 'after',
                                        delay = 0.4,
                                        func = function()
                                            play_sound('timpani')
                                            SMODS.add_card({ set = 'Spectral', })                            
                                            card:juice_up(0.3, 0.5)
                                            return true
                                        end
                                    }))
                                end
                                delay(0.6)
                                
                                if created_consumable then
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                                end
                                return true
                            end,
                            colour = G.C.SECONDARY_SET.Spectral
                        }
                    }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.multvar
            }
        end
    end
}