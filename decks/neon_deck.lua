
SMODS.Back {
    key = 'neon_deck',
    pos = { x = 2, y = 0 },
    config = {
        vouchers = { "v_overstock_norm" , "v_overstock_plus" },
    },
    loc_txt = {
        name = 'Neon Deck',
        text = {
            [1] = 'Start with {C:attention}Overstock{}',
            [2] = 'and {C:attention}Overstock Plus{}',
            [3] = 'Increase {C:green}Reroll{} cost',
            [4] = 'by {C:gold}$1{} each Ante'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            return {
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + 1
                        G.GAME.current_round.reroll_cost = math.max(0,
                        G.GAME.current_round.reroll_cost + 1)
                        return true
                    end
                }))
                
            }
        end
    end,
    
}