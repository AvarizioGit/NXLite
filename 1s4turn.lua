
SMODS.Joker{ --S4TURN
    key = "1s4turn",
    config = {
        extra = {
            chipsvar = 0,
            multvar = 0
        }
    },
    loc_txt = {
        ['name'] = 'S4TURN',
        ['text'] = {
            [1] = 'If played hand is a {C:attention}Straight{} this Joker',
            [2] = 'gives {C:blue}+#1#{} Chips and {C:red}+#2#{} Mult and',
            [3] = 'gains {C:blue}+30{} Chips and {C:red}+3{} Mult',
            [4] = '{C:inactive}(Resets each round){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chipsvar, card.ability.extra.multvar}}
    end,
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if context.scoring_name == "Straight" then
                return {
                    func = function()
                        card.ability.extra.chipsvar = (card.ability.extra.chipsvar) + 30
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.multvar = (card.ability.extra.multvar) + 3
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Straight" then
                return {
                    chips = card.ability.extra.chipsvar,
                    extra = {
                        mult = card.ability.extra.multvar
                    }
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.chipsvar = 0
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.multvar = 0
                        return true
                    end,
                    colour = G.C.BLUE
                }
            }
        end
    end
}