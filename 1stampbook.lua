
SMODS.Joker{ --Stamp Book
    key = "1stampbook",
    config = {
        extra = {
            moneyvar = 0,
            specvar = 0,
            tarvar = 0,
            planetvar = 0,
            exvar = 0
        }
    },
    loc_txt = {
        ['name'] = 'Stamp Book',
        ['text'] = {
            [1] = 'This Joker gains {C:gold}$2{} for each',
            [2] = '{C:attention}unique{} type of {C:attention}consumables{} used',
            [3] = '{C:inactive}(Currently{} {C:gold}$#1#{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 2
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
        
        return {vars = {card.ability.extra.moneyvar, card.ability.extra.specvar, card.ability.extra.tarvar, card.ability.extra.planetvar, card.ability.extra.exvar}}
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  then
            if (context.consumeable and context.consumeable.ability.set == 'Tarot' and to_big((card.ability.extra.tarvar or 0)) == to_big(0)) then
                return {
                    func = function()
                        card.ability.extra.moneyvar = (card.ability.extra.moneyvar) + 2
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.tarvar = (card.ability.extra.tarvar) + 1
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            elseif (context.consumeable and context.consumeable.ability.set == 'Planet' and to_big((card.ability.extra.planetvar or 0)) == to_big(0)) then
                return {
                    func = function()
                        card.ability.extra.moneyvar = (card.ability.extra.moneyvar) + 2
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.planetvar = (card.ability.extra.planetvar) + 1
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            elseif (context.consumeable and context.consumeable.ability.set == 'Spectral' and to_big((card.ability.extra.specvar or 0)) == to_big(0)) then
                return {
                    func = function()
                        card.ability.extra.moneyvar = (card.ability.extra.moneyvar) + 2
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.specvar = (card.ability.extra.specvar) + 1
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            elseif (context.consumeable and (context.consumeable.ability.set == 'extar' or context.consumeable.ability.set == 'extar') and to_big((card.ability.extra.exvar or 0)) == to_big(0)) then
                return {
                    func = function()
                        card.ability.extra.moneyvar = (card.ability.extra.moneyvar) + 2
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.exvar = (card.ability.extra.exvar) + 1
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + card.ability.extra.moneyvar
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.moneyvar), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}