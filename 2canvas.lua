
SMODS.Joker{ --Canvas
    key = "2canvas",
    config = {
        extra = {
            handsizevar = 0,
            hand_size0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Canvas',
        ['text'] = {
            [1] = '{C:attention}+1{} hand size per consecutive',
            [2] = 'hand containing a {C:attention}Flush{}',
            [3] = '{C:inactive}(Currently{} {C:attention}+#1#{} {C:inactive}hand size){}',
            [4] = '{C:inactive}(Max of{} {C:attention}+4{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 24
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.handsizevar}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (to_big((card.ability.extra.handsizevar or 0)) ~= to_big(4) and next(context.poker_hands["Flush"])) then
                card.ability.extra.handsizevar = (card.ability.extra.handsizevar) + 1
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hand Limit", colour = G.C.BLUE})
                        
                        G.hand:change_size(1)
                        return true
                    end
                }
            elseif not (next(context.poker_hands["Flush"])) then
                local handsizevar_value = card.ability.extra.handsizevar
                card.ability.extra.handsizevar = 0
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(handsizevar_value).." Hand Limit", colour = G.C.BLUE})
                        
                        G.hand:change_size(-handsizevar_value)
                        return true
                    end
                }
            end
        end
        if context.selling_self  then
            if to_big((card.ability.extra.handsizevar or 0)) > to_big(0) then
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.handsizevar).." Hand Limit", colour = G.C.BLUE})
                        
                        G.hand:change_size(-card.ability.extra.handsizevar)
                        return true
                    end
                }
            end
        end
    end
}