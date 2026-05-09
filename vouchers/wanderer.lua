
SMODS.Voucher {
    key = 'wanderer',
    pos = { x = 0, y = 1 },
    config = { 
        extra = {
            odds = 2
        } 
    },
    loc_txt = {
        name = 'Wanderer',
        text = {
            [1] = '{C:green}#1# in #2#{} chance to gain a {C:attention}Double{}',
            [2] = '{C:attention}Tag{} when a Blind is {C:attention}skipped{}'
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
    
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'v_nx_wanderer')
        return {vars = {numerator, denominator}}
    end,calculate = function(self, card, context)
        if context.skip_blind then
            if SMODS.pseudorandom_probability(card, 'group_0_8c55cd54', 1, card.ability.extra.odds, 'j_nx_wanderer', false) then
                SMODS.calculate_effect({func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local tag = Tag("tag_double")
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
                end}, card)
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Created Tag!", colour = G.C.GREEN})
            end
        end
    end
}