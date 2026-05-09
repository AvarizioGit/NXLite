
SMODS.Joker{ --Shopping Cart
    key = "2shoppingcart",
    config = {
        extra = {
            Multvar = 0,
            alljokerssellvalue = 0
        }
    },
    loc_txt = {
        ['name'] = 'Shopping Cart',
        ['text'] = {
            [1] = 'Gains {C:blue}+Chips{} by twice the {C:attention}sell value{}',
            [2] = 'of each Joker at end of round',
            [3] = '{C:inactive}(Currently{} {C:blue}+#1#{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 8
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
    pools = { ["nx_nx_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
    return {vars = {card.ability.extra.Multvar, ((function() local total = 0; for _, joker in ipairs(G.jokers and (G.jokers and G.jokers.cards or {}) or {}) do total = total + joker.sell_cost end; return total end)()) * 2}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                card.ability.extra.Multvar = (card.ability.extra.Multvar) + ((function() local total = 0; for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do total = total + joker.sell_cost end; return total end)()) * 2
                    return true
                end,
                message = "Added to Cart!"
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.Multvar
            }
        end
    end
}