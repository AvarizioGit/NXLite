
SMODS.Joker{ --Lone Wolf
    key = "3lonewolf",
    config = {
        extra = {
            multvar = 1
        }
    },
    loc_txt = {
        ['name'] = 'Lone Wolf',
        ['text'] = {
            [1] = 'Gives {X:red,C:white}X#1#{} Mult when playing a {C:attention}High Card{}',
            [2] = 'Increases by {X:red,C:white}X0.1{} when a {C:attention}High Card{} is',
            [3] = 'played and {X:red,C:white}X0.25{} when a {C:planet}Pluto{} is used'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 23
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["nx_nx_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.multvar}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "High Card" then
                card.ability.extra.multvar = (card.ability.extra.multvar) + 0.1
                return {
                    Xmult = card.ability.extra.multvar
                }
            end
        end
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Planet' and context.consumeable.config.center.key == 'c_pluto' then
                return {
                    func = function()
                        card.ability.extra.multvar = (card.ability.extra.multvar) + 0.25
                        return true
                    end
                }
            end
        end
    end
}