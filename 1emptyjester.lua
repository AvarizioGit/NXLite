
SMODS.Joker{ --Empty Jester
    key = "1emptyjester",
    config = {
        extra = {
            freejokerslots = 0,
            freeconsumableslots = 0
        }
    },
    loc_txt = {
        ['name'] = 'Empty Jester',
        ['text'] = {
            [1] = '{C:red}+3{} Mult and {C:blue}+20{} Chips for every empty',
            [2] = '{C:attention}Joker slot {}and {C:attention}Consumable slot{} respectively',
            [3] = '{C:inactive}(Currently {}{C:red}+#1#{} {C:inactive}Mult and{} {C:blue}+#2#{}{C:inactive} Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
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
        
        return {vars = {(((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and (G.jokers and G.jokers.cards or {}) or {}))) * 3, ((((G.consumeables and G.consumeables.config.card_limit or 0) - #(G.consumeables and G.consumeables.cards or {})) or 0)) * 20}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = (((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and G.jokers.cards or {}))) * 3,
                extra = {
                    chips = (((G.consumeables and G.consumeables.config.card_limit or 0) - #(G.consumeables and G.consumeables.cards or {}))) * 20,
                    colour = G.C.CHIPS
                }
            }
        end
    end
}