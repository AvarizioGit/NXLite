
SMODS.Voucher {
    key = 'hand_mutation',
    pos = { x = 9, y = 0 },
    config = { 
        extra = {
            play_size0 = 1,
            discard_size0 = 1,
            hand_size0 = 1
        } 
    },
    loc_txt = {
        name = 'Hand Mutation',
        text = {
            [1] = '{C:attention}+1{} Hand size',
            [2] = '{C:attention}+1{} Card selection limit'
        },
        unlock = {
            [1] = ''
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'v_nx_sixth_finger'},
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
                colour = G.C.WHITE,
                extra = {
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            
                            G.hand:change_size(1)
                            return true
                        end
                    })),
                    colour = G.C.WHITE
                }
            }
        }
    end
}