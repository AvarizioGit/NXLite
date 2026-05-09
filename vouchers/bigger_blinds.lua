
SMODS.Voucher {
    key = 'bigger_blinds',
    pos = { x = 6, y = 0 },
    config = { 
        extra = {
            dollars0 = 5,
            all_blinds_size0 = 1.5
        } 
    },
    loc_txt = {
        name = 'Bigger Blinds',
        text = {
            [1] = '{C:attention}150%{} Blind requirements',
            [2] = 'Gain {C:gold}$5{} at end of round'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 5
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value, true)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+"..tostring(5), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end, redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 1.5
                return true
            end
        }))
    end
}