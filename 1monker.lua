
SMODS.Joker{ --Monker
    key = "1monker",
    config = {
        extra = {
            mult0 = 20,
            xmult0 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Monker',
        ['text'] = {
            [1] = '{C:attention}Gros Michel{} gives {C:red}+20{} Mult',
            [2] = '{C:attention}Cavendish{} gives {X:red,C:white}X4{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["nx_nx_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_gros_michel" then 
                        return true
                    end
                end
            end)() then
                return {
                    mult = 20
                }
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_cavendish" then 
                        return true
                    end
                end
            end)() then
                return {
                    Xmult = 4
                }
            end
        end
    end
}