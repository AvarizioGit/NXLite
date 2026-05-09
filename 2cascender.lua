
SMODS.Joker{ --Cult Ascender
    key = "2cascender",
    config = {
        extra = {
            chipvar = 5,
            trigvar = 0
        }
    },
    loc_txt = {
        ['name'] = 'Cult Ascender',
        ['text'] = {
            [1] = 'Played {C:attention}cards {}permanently gains {C:blue}+#1#{} Chips when scored',
            [2] = '{C:attention}Increases{} Chip gain by {C:blue}+1{} and create a',
            [3] = '{C:spectral}Spectral{} card every {C:attention}25{} cards scored',
            [4] = '{C:inactive}(Currently{} {C:attention}#2#{}{C:inactive}/25){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["nx_nx_jokers"] = true, ["nx_cult"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chipvar, card.ability.extra.trigvar}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if to_big((card.ability.extra.trigvar or 0)) ~= to_big(24) then
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.chipvar
                card.ability.extra.trigvar = (card.ability.extra.trigvar) + 1
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }, card = card
                }
            elseif to_big((card.ability.extra.trigvar or 0)) == to_big(24) then
                local chipvar_value = card.ability.extra.chipvar
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + chipvar_value
                card.ability.extra.chipvar = (card.ability.extra.chipvar) + 1
                card.ability.extra.trigvar = 0
                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            play_sound('timpani')
                            SMODS.add_card({ set = 'Spectral', })                            
                            card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
                delay(0.6)
                return {
                    message = created_consumable and localize('k_plus_spectral') or nil
                }
            end
        end
    end
}