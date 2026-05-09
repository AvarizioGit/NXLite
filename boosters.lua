
SMODS.Booster {
    key = 'nox_common_pack',
    loc_txt = {
        name = "Nox Common Pack",
        text = {
            [1] = 'Choose {C:attention}1{} out of {C:attention}5{}',
            [2] = '{C:blue}Common{} Jokers'
        },
        group_name = "Nox Common Pack"
    },
    config = { extra = 5, choose = 1 },
    cost = 6,
    weight = 0.75,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "Joker",
            rarity = "Common",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "nx_nox_common_pack"
        }
    end,
    particles = function(self)
        -- No particles for joker packs
        end,
    }
    
    
    SMODS.Booster {
        key = 'noxuncommonpack',
        loc_txt = {
            name = "Nox Uncommon Pack",
            text = {
                [1] = 'Choose {C:attention}1{} out of {C:attention}4{}',
                [2] = '{C:green}Uncommon{} Jokers'
            },
            group_name = "Nox Uncommon Pack"
        },
        config = { extra = 4, choose = 1 },
        cost = 10,
        weight = 0.5,
        atlas = "CustomBoosters",
        pos = { x = 1, y = 0 },
        discovered = true,
        loc_vars = function(self, info_queue, card)
            local cfg = (card and card.ability) or self.config
            return {
                vars = { cfg.choose, cfg.extra }
            }
        end,
        create_card = function(self, card, i)
            return {
                set = "Joker",
                rarity = "Uncommon",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "nx_noxuncommonpack"
            }
        end,
        particles = function(self)
            -- No particles for joker packs
            end,
        }
        
        
        SMODS.Booster {
            key = 'nox_rare_pack',
            loc_txt = {
                name = "Nox Rare Pack",
                text = {
                    [1] = 'Choose {C:attention}1{} out of {C:attention}3{}',
                    [2] = '{C:red}Rare{} Jokers'
                },
                group_name = "Nox Rare Pack"
            },
            config = { extra = 3, choose = 1 },
            cost = 15,
            weight = 0.35,
            atlas = "CustomBoosters",
            pos = { x = 2, y = 0 },
            discovered = true,
            loc_vars = function(self, info_queue, card)
                local cfg = (card and card.ability) or self.config
                return {
                    vars = { cfg.choose, cfg.extra }
                }
            end,
            create_card = function(self, card, i)
                return {
                    set = "Joker",
                    rarity = "Rare",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append = "nx_nox_rare_pack"
                }
            end,
            particles = function(self)
                -- No particles for joker packs
                end,
            }
            
            
            SMODS.Booster {
                key = 'nox_legends_pack',
                loc_txt = {
                    name = "Nox Legends Pack",
                    text = {
                        [1] = 'Choose {C:attention}1{} out of {C:attention}2{}',
                        [2] = '{C:purple}Legendary{} Jokers'
                    },
                    group_name = "Nox Legends Pack"
                },
                config = { extra = 2, choose = 1 },
                cost = 30,
                weight = 0.1,
                atlas = "CustomBoosters",
                pos = { x = 3, y = 0 },
                discovered = true,
                loc_vars = function(self, info_queue, card)
                    local cfg = (card and card.ability) or self.config
                    return {
                        vars = { cfg.choose, cfg.extra }
                    }
                end,
                create_card = function(self, card, i)
                    return {
                        set = "Joker",
                        rarity = "Legendary",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "nx_nox_legends_pack"
                    }
                end,
                particles = function(self)
                    -- No particles for joker packs
                    end,
                }
                