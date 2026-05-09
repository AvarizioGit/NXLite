
SMODS.Back {
    key = 'cream_deck',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            hand_size0 = 1
        },
        vouchers = { "v_nx_sixth_finger" },
    },
    loc_txt = {
        name = 'Cream Deck',
        text = {
            [1] = 'Start with {C:attention}Sixth Finger{}',
            [2] = 'and {C:attention}+1{} hand size'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    G.hand:change_size(1)
                    return true
                end
            }))
        }
    end
}