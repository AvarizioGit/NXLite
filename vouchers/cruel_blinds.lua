
SMODS.Voucher {
    key = 'cruel_blinds',
    pos = { x = 7, y = 0 },
    config = { 
        extra = {
            dollars0 = 10,
            all_blinds_size0 = 2
        } 
    },
    loc_txt = {
        name = 'Cruel Blinds',
        text = {
            [1] = '{C:attention}200%{} Blind requirements',
            [2] = 'Gain {C:gold}$10{} and a random',
            [3] = '{C:attention}Tag{} at end of round'
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
    requires = {'v_nx_bigger_blinds'},
    atlas = 'CustomVouchers',
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 10
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value, true)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+"..tostring(10), colour = G.C.MONEY})
                    return true
                end,
                extra = {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local selected_tag = pseudorandom_element(G.P_TAGS, pseudoseed("create_tag")).key
                                local tag = Tag(selected_tag)
                                if tag.name == "Orbital Tag" then
                                    local _poker_hands = {}
                                    for k, v in pairs(G.GAME.hands) do
                                        if v.visible then
                                            _poker_hands[#_poker_hands + 1] = k
                                        end
                                    end
                                    tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                                end
                                tag:set_ability()
                                add_tag(tag)
                                play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                                return true
                            end
                        }))
                        return true
                    end,
                    message = "Created Tag!",
                    colour = G.C.GREEN
                }
            }
        end
    end, redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 2
                return true
            end
        }))
    end
}