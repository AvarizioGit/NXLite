
SMODS.Voucher {
    key = 'journeyman',
    pos = { x = 1, y = 1 },
    config = { 
        extra = {
            odds = 3,
            ante_value0 = 1
        } 
    },
    loc_txt = {
        name = 'Journeyman',
        text = {
            [1] = '{C:green}#1# in #2#{} chance for {C:attention}-1{}',
            [2] = 'Ante when a Blind is {C:attention}skipped{}'
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
    requires = {'v_nx_wanderer'},
    atlas = 'CustomVouchers',
    
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'v_nx_journeyman')
        return {vars = {numerator, denominator}}
    end,calculate = function(self, card, context)
        if context.skip_blind then
            if SMODS.pseudorandom_probability(card, 'group_0_8c55cd54', 1, card.ability.extra.odds, 'j_nx_journeyman', false) then
                local mod = -1
                ease_ante(mod)
                G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
                
            end
        end
    end
}