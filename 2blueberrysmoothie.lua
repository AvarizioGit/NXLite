
SMODS.Joker{ --Blueberry Smoothie
    key = "2blueberrysmoothie",
    config = {
        extra = {
            roundvar = 3,
            pb_x_chips_528b3464 = 0.15
        }
    },
    loc_txt = {
        ['name'] = 'Blueberry Smoothie',
        ['text'] = {
            [1] = 'Cards gains {X:blue,C:white}X0.15{} Chips when {C:attention}scored{}',
            [2] = '{C:inactive}(Lasts for #1# rounds){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["nx_nx_jokers"] = true, ["nx_food"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.roundvar}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big((card.ability.extra.roundvar or 0)) <= to_big(1) then
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
                    end
                }
            else
                return {
                    func = function()
                        card.ability.extra.roundvar = math.max(0, (card.ability.extra.roundvar) - 1)
                        return true
                    end
                }
            end
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.ability.perma_x_chips = context.other_card.ability.perma_x_chips or 0
            context.other_card.ability.perma_x_chips = context.other_card.ability.perma_x_chips + 0.15
            return {
                extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }, card = card
            }
        end
    end
}