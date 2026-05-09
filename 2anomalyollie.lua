
SMODS.Joker{ --Anomaly Ollie
    key = "2anomalyollie",
    config = {
        extra = {
            chips0 = 53,
            xchips0 = 1.3
        }
    },
    loc_txt = {
        ['name'] = 'Anomaly Ollie',
        ['text'] = {
            [1] = 'Played cards with {C:attention}odd{} rank give',
            [2] = '{C:blue}+53{} Chips when {C:attention}scored{} and {X:blue,C:white}X1.3{}',
            [3] = 'Chips when {C:attention}held in hand{}',
            [4] = '{C:inactive} (A, 9, 7, 5, 3){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 22
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["nx_nx_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'uta' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 14 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9) then
                return {
                    chips = 53
                }
            end
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if (context.other_card:get_id() == 14 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9) then
                return {
                    x_chips = 1.3
                }
            end
        end
    end
}