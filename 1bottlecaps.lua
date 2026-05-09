
SMODS.Joker{ --Bottlecaps
    key = "1bottlecaps",
    config = {
        extra = {
            chipvar = 0,
            scalevar = 1
        }
    },
    loc_txt = {
        ['name'] = 'Bottlecaps',
        ['text'] = {
            [1] = 'Played cards gives {C:blue}+#1#{} Chips when {C:attention}scored{}',
            [2] = 'Increase by {C:blue}+#2#{} for each card {C:attention}discarded{}',
            [3] = '{C:inactive}(Resets at end of round){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 22
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
        
        return {vars = {card.ability.extra.chipvar, card.ability.extra.scalevar}}
    end,
    
    calculate = function(self, card, context)
        if context.discard  then
            return {
                func = function()
                    card.ability.extra.chipvar = (card.ability.extra.chipvar) + card.ability.extra.scalevar
                    return true
                end
            }
        end
        if context.individual and context.cardarea == G.play  then
            return {
                chips = card.ability.extra.chipvar
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.chipvar = 0
                    return true
                end
            }
        end
    end
}