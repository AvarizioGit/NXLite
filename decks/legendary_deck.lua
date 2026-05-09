
SMODS.Back {
    key = 'legendary_deck',
    pos = { x = 5, y = 0 },
    config = {
        vouchers = { "v_nx_bigger_blinds" },
    },
    loc_txt = {
        name = 'Legendary Deck',
        text = {
            [1] = 'Start with a {C:legendary}Legendary{}',
            [2] = 'Joker and {C:attention}Bigger Blinds{}',
            [3] = 'Win at Ante {C:attention}12{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'Legendary' })
                if new_joker then
                end
                return true
            end
        }))
        G.GAME.win_ante = 12
    end
}