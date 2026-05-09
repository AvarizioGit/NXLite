
SMODS.Consumable {
    key = 'hati',
    set = 'Planet',
    pos = { x = 2, y = 0 },
    loc_txt = {
        name = 'Hati',
        text = {
            [1] = 'Levels up {C:attention}Full House{},',
            [2] = '{C:attention}Four of a Kind{}, and {C:attention}Straight Flush{}'
        }
    },
    cost = 4,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { 
                handname = localize('Full House', 'poker_hands'), 
                chips = G.GAME.hands['Full House'].chips, 
                mult = G.GAME.hands['Full House'].mult, 
                level = G.GAME.hands['Full House'].level 
            }
        )
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(1) })
        delay(1.3)
        level_up_hand(card, "Full House", true, 1)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
            {handname=localize('Full House', 'poker_hands'), 
                chips = G.GAME.hands['Full House'].chips, 
                mult = G.GAME.hands['Full House'].mult, 
            level=G.GAME.hands['Full House'].level})    
            delay(1.3)
            update_hand_text(
                { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                { 
                    handname = localize('Four of a Kind', 'poker_hands'), 
                    chips = G.GAME.hands['Four of a Kind'].chips, 
                    mult = G.GAME.hands['Four of a Kind'].mult, 
                    level = G.GAME.hands['Four of a Kind'].level 
                }
            )
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = true
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = nil
                    return true
                end
            }))
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(1) })
            delay(1.3)
            level_up_hand(card, "Four of a Kind", true, 1)
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                {handname=localize('Four of a Kind', 'poker_hands'), 
                    chips = G.GAME.hands['Four of a Kind'].chips, 
                    mult = G.GAME.hands['Four of a Kind'].mult, 
                level=G.GAME.hands['Four of a Kind'].level})    
                delay(1.3)
                update_hand_text(
                    { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                    { 
                        handname = localize('Straight Flush', 'poker_hands'), 
                        chips = G.GAME.hands['Straight Flush'].chips, 
                        mult = G.GAME.hands['Straight Flush'].mult, 
                        level = G.GAME.hands['Straight Flush'].level 
                    }
                )
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        play_sound('tarot1')
                        card:juice_up(0.8, 0.5)
                        G.TAROT_INTERRUPT_PULSE = true
                        return true
                    end
                }))
                update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.9,
                    func = function()
                        play_sound('tarot1')
                        card:juice_up(0.8, 0.5)
                        return true
                    end
                }))
                update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.9,
                    func = function()
                        play_sound('tarot1')
                        card:juice_up(0.8, 0.5)
                        G.TAROT_INTERRUPT_PULSE = nil
                        return true
                    end
                }))
                update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(1) })
                delay(1.3)
                level_up_hand(card, "Straight Flush", true, 1)
                update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                    {handname=localize('Straight Flush', 'poker_hands'), 
                        chips = G.GAME.hands['Straight Flush'].chips, 
                        mult = G.GAME.hands['Straight Flush'].mult, 
                    level=G.GAME.hands['Straight Flush'].level})    
                    delay(1.3)
                end,
                can_use = function(self, card)
                    return true
                end
            }