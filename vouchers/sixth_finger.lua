
SMODS.Voucher {
    key = 'sixth_finger',
    pos = { x = 8, y = 0 },
    config = { 
        extra = {
            play_size0 = 1,
            discard_size0 = 1
        } 
    },
    loc_txt = {
        name = 'Sixth Finger',
        text = {
            [1] = '{C:attention}+1{} Card selection limit'
        },
        unlock = {
            [1] = ''
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    SMODS.change_play_limit(1)
                    return true
                end
            })),
            extra = {
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        
                        SMODS.change_discard_limit(1)
                        return true
                    end
                })),
                colour = G.C.WHITE
            }
        }
    end
}