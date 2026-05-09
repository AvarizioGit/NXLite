
SMODS.Back {
    key = 'swirl_deck',
    pos = { x = 4, y = 0 },
    config = {
        extra = {
            all_blinds_size0 = 2
        },
    },
    loc_txt = {
        name = 'Swirl Deck',
        text = {
            [1] = '{X:attention,C:white}X0.5{} Blind requirements',
            [2] = 'Win at Ante {C:attention}12{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling / 2
                return true
            end
        }))
        G.GAME.win_ante = 12
    end
}