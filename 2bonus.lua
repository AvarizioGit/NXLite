
SMODS.Joker{ --Bonus+
    key = "2bonus",
    config = {
        extra = {
            xchips0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Bonus+',
        ['text'] = {
            [1] = '{C:attention}Bonus {}cards gives {X:blue,C:white}X1.5{}',
            [2] = 'Chips when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 3
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
    pools = { ["nx_nx_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_bonus"] == true then
                return {
                    x_chips = 1.5
                }
            end
        end
    end
}