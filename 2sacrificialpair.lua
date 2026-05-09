
SMODS.Joker{ --Sacrificial Pair
    key = "2sacrificialpair",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Sacrificial Pair',
        ['text'] = {
            [1] = 'If {C:attention}played hand{} consists only of a {C:attention}pair{} of {C:attention}#1#{}',
            [2] = '{C:red}destroy{} it and creates a random {C:dark_edition}Negative{} Joker',
            [3] = '{C:inactive}(Rank changes every round){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 23
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
        
        return {vars = {localize((G.GAME.current_round.rankvar_card or {}).rank or 'Ace', 'ranks')}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.rankvar_card = { rank = 'Ace', id = 14 }
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (to_big(#context.full_hand) == to_big(2) and (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:get_id() == G.GAME.current_round.rankvar_card.id then
                        count = count + 1
                    end
                end
                return count == 2
            end)()) then
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker' })
                        if joker_card then
                            joker_card:set_edition("e_negative", true)
                            
                        end
                        
                        return true
                    end
                }))
                return {
                    message = created_joker and localize('k_plus_joker') or nil
                }
            end
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (to_big(#context.full_hand) == to_big(2) and (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:get_id() == G.GAME.current_round.rankvar_card.id then
                        count = count + 1
                    end
                end
                return count == 2
            end)()) then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if G.playing_cards then
                local valid_rankvar_cards = {}
                for _, v in ipairs(G.playing_cards) do
                    if not SMODS.has_no_rank(v) then
                        valid_rankvar_cards[#valid_rankvar_cards + 1] = v
                    end
                end
                if valid_rankvar_cards[1] then
                    local rankvar_card = pseudorandom_element(valid_rankvar_cards, pseudoseed('rankvar' .. G.GAME.round_resets.ante))
                    G.GAME.current_round.rankvar_card.rank = rankvar_card.base.value
                    G.GAME.current_round.rankvar_card.id = rankvar_card.base.id
                end
            end
        end
    end
}