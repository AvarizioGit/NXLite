
SMODS.Joker{ --Nope! No Numbers!
    key = "1nonumbers",
    config = {
        extra = {
            set_probability0 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Nope! No Numbers!',
        ['text'] = {
            [1] = 'Sets all {C:attention}listed{} {C:green}probabilities{} to {C:attention}0{}',
            [2] = '{C:inactive}(ex:{} {C:green}1 in 4{} {C:inactive}->{} {C:green}0 in 4{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["nx_nx_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.fix_probability  then
            local numerator, denominator = context.numerator, context.denominator
            numerator = 0
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
    end
}