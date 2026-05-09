
SMODS.Back {
    key = 'golden_deck',
    pos = { x = 6, y = 0 },
    config = {
        extra = {
            hand_size0 = 2,
            item_rate0 = 0.5
        },
        vouchers = { "v_overstock_norm" , "v_telescope" , "v_tarot_merchant" , "v_planet_merchant" , "v_crystal_ball" },
        consumables = {"c_fool","c_fool","c_hex"},
    },
    loc_txt = {
        name = 'Golden Deck',
        text = {
            [1] = 'Applies the {C:attention}upside{}',
            [2] = 'of all {C:attention}Vanilla{} decks'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            return {
                func = function()
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
                end,
                message = "Created Tag!"
            }
        end
    end,
    apply = function(self, back)
        G.GAME.modifiers.money_per_hand = 2
        G.GAME.modifiers.money_per_discard = 1
        G.GAME.starting_params.dollars = G.GAME.starting_params.dollars +10
        G.GAME.starting_params.hands = G.GAME.starting_params.hands + 1
        G.GAME.starting_params.hands = G.GAME.starting_params.hands + 1
        G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + 1
        G.GAME.spectral_rate = 0.5
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    G.hand:change_size(2)
                    return true
                end
            }))
        }
    end
}