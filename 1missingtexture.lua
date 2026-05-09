
SMODS.Joker{ --missingtexture.joker
    key = "1missingtexture",
    config = {
        extra = {
            odds = 3,
            mult0 = 20
        }
    },
    loc_txt = {
        ['name'] = 'missingtexture.joker',
        ['text'] = {
            [1] = '{C:green}nil in nil{} chance to give {C:red}+nil{}',
            [2] = 'Mult when hand is played'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_nx_1missingtexture') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_04f5c5d0', 1, card.ability.extra.odds, 'j_nx_1missingtexture', false) then
                    SMODS.calculate_effect({mult = 20}, card)
                end
            end
        end
    end
}