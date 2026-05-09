
SMODS.Joker{ --Binary Joker
    key = "2binaryjoker",
    config = {
        extra = {
            multvar = 0,
            multinc = 2
        }
    },
    loc_txt = {
        ['name'] = 'Binary Joker',
        ['text'] = {
            [1] = 'This Joker gains {C:red}+#2#{} Mult',
            [2] = 'when a {C:attention}10{} is scored',
            [3] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["nx_nx_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.multvar, card.ability.extra.multinc}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 10 then
                card.ability.extra.multvar = (card.ability.extra.multvar) + card.ability.extra.multinc
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((card.ability.extra.multvar or 0)) > to_big(0) then
                return {
                    mult = card.ability.extra.multvar
                }
            end
        end
    end
}