
SMODS.Joker{ --Temper Temper
    key = "2tempertemper",
    config = {
        extra = {
            alljokerssellvalue = 0
        }
    },
    loc_txt = {
        ['name'] = 'Temper Temper',
        ['text'] = {
            [1] = 'Gain {C:gold}money{} at {C:attention}end of round{}',
            [2] = 'based on all Joker\'s {C:attention}sell value{}',
            [3] = '{C:inactive}(Currently{} {C:gold}$#1#{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["nx_nx_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
    return {vars = {(function() local total = 0; for _, joker in ipairs(G.jokers and (G.jokers and G.jokers.cards or {}) or {}) do total = total + joker.sell_cost end; return total end)()}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                local target_dollars = G.GAME.dollars + (function() local total = 0; for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do total = total + joker.sell_cost end; return total end)()
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring((function() local total = 0; for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do total = total + joker.sell_cost end; return total end)()), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}