
SMODS.Joker{ --Reach The Stars
    key = "2reachthestars",
    config = {
        extra = {
            chipsvar = 0,
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'Reach The Stars',
        ['text'] = {
            [1] = '{C:attention}Queens{} held in hand has a {C:green}#2# in #3#{}',
            [2] = 'chance to give {C:blue}+13{} Chips to this Joker',
            [3] = '{C:inactive}(Currently{} {C:blue}+#1#{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 7
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_nx_2reachthestars') 
        return {vars = {card.ability.extra.chipsvar, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:get_id() == 12 then
                if SMODS.pseudorandom_probability(card, 'group_0_5e4871d4', 1, card.ability.extra.odds, 'j_nx_2reachthestars', false) then
                    SMODS.calculate_effect({func = function()
                        card.ability.extra.chipsvar = (card.ability.extra.chipsvar) + 13
                        return true
                    end}, card)
                end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chipsvar
            }
        end
    end
}