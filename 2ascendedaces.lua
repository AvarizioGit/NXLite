
SMODS.Joker{ --Ascended Aces
    key = "2ascendedaces",
    config = {
        extra = {
            xmult0 = 1.25,
            xchips0 = 1.25
        }
    },
    loc_txt = {
        ['name'] = 'Ascended Aces',
        ['text'] = {
            [1] = 'Played {C:attention}Aces{} gives {X:tarot,C:white}X1.25{} Mult',
            [2] = 'and Chips when {C:attention}scored{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 22
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
        
        return {vars = {card.ability.extra.xmult0, card.ability.extra.xchips0}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 14 then
                return {
                    Xmult = card.ability.extra.xmult0,
                    extra = {
                        x_chips = card.ability.extra.xchips0,
                        colour = G.C.DARK_EDITION
                    }
                }
            end
        end
    end
}