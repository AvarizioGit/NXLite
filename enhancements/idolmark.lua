
SMODS.Enhancement {
    key = 'idolmark',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            retrigger_times = 1
        }
    },
    loc_txt = {
        name = 'Idol Mark',
        text = {
            [1] = 'Retrigger scored cards {C:attention}once{}'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 2,
    calculate = function(self, card, context)
        if context.repetition and card.should_retrigger then
            return { repetitions = card.ability.extra.retrigger_times }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_retrigger = false
            card.should_retrigger = true
        end
    end
}