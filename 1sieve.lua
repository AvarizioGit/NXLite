
SMODS.Joker{ --Sieve
    key = "1sieve",
    config = {
        extra = {
            moneyvar = 5,
            odds = 2,
            odds2 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Sieve',
        ['text'] = {
            [1] = 'Played {C:attention}Stone cards{} has a {C:green}#2# in #3#{}',
            [2] = 'chance to earn {C:gold}$#1#{} and {C:green}#4# in #5#{}',
            [3] = 'chance to be destroyed when {C:attention}scored{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["nx_nx_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_nx_1sieve')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_nx_1sieve')
        return {vars = {card.ability.extra.moneyvar, new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if SMODS.get_enhancements(context.other_card)["m_stone"] == true then
                if SMODS.pseudorandom_probability(card, 'group_0_a5efe4b9', 1, card.ability.extra.odds, 'j_nx_1sieve', false) then
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + card.ability.extra.moneyvar
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.moneyvar), colour = G.C.MONEY})
                            return true
                        end}, card)
                    end
                    if SMODS.pseudorandom_probability(card, 'group_1_2405b2aa', 1, card.ability.extra.odds2, 'j_nx_1sieve', false) then
                        context.other_card.should_destroy = true
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                    end
                end
            end
        end
    }