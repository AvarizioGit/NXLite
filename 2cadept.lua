
SMODS.Joker{ --Cult Adept
    key = "2cadept",
    config = {
        extra = {
            chipvar = 10,
            multvar = 2
        }
    },
    loc_txt = {
        ['name'] = 'Cult Adept',
        ['text'] = {
            [1] = 'Played {C:attention}Aces{} give {C:blue}+#1#{} Chips and {C:red}+#2#{} Mult when scored',
            [2] = '{C:attention}Increases{} by {C:blue}+5{} Chips and {C:red}+1{} Mult when a {C:spectral}Spectral{} card is {C:attention}used{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
        
        return {vars = {card.ability.extra.chipvar, card.ability.extra.multvar}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 14 then
                return {
                    chips = card.ability.extra.chipvar,
                    extra = {
                        mult = card.ability.extra.multvar
                    }
                }
            end
        end
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Spectral' then
                return {
                    func = function()
                        card.ability.extra.chipvar = (card.ability.extra.chipvar) + 5
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.multvar = (card.ability.extra.multvar) + 1
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            end
        end
    end
}