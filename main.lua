SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomVouchers", 
    path = "CustomVouchers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end
-- this function is used to load everything within a folder.-- Jokerforge doesnt use it because it doesnt make loading order easy
local function load_folder(path)
    local files = NFS.getDirectoryItemsInfo(mod_path .. "/" .. path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file(path .. file_name))()
        end
    end
end
-- load the jokers
if true then
    assert(SMODS.load_file("jokers/1bottlecaps.lua"))()
    assert(SMODS.load_file("jokers/1catalyst.lua"))()
    assert(SMODS.load_file("jokers/1chastejester.lua"))()
    assert(SMODS.load_file("jokers/1generousjester.lua"))()
    assert(SMODS.load_file("jokers/1patientjester.lua"))()
    assert(SMODS.load_file("jokers/1temperatejester.lua"))()
    assert(SMODS.load_file("jokers/1classification.lua"))()
    assert(SMODS.load_file("jokers/1czealot.lua"))()
    assert(SMODS.load_file("jokers/1e4rth.lua"))()
    assert(SMODS.load_file("jokers/1jup1ter.lua"))()
    assert(SMODS.load_file("jokers/1s4turn.lua"))()
    assert(SMODS.load_file("jokers/1emptyjester.lua"))()
    assert(SMODS.load_file("jokers/1fivefingerdiscount.lua"))()
    assert(SMODS.load_file("jokers/1jestertemplate.lua"))()
    assert(SMODS.load_file("jokers/1missingtexture.lua"))()
    assert(SMODS.load_file("jokers/1monker.lua"))()
    assert(SMODS.load_file("jokers/1nonumbers.lua"))()
    assert(SMODS.load_file("jokers/1patternrecognition.lua"))()
    assert(SMODS.load_file("jokers/1sieve.lua"))()
    assert(SMODS.load_file("jokers/1stampbook.lua"))()
    assert(SMODS.load_file("jokers/1supplydrop.lua"))()
    assert(SMODS.load_file("jokers/1wipjoker.lua"))()
    assert(SMODS.load_file("jokers/2allrounder.lua"))()
    assert(SMODS.load_file("jokers/2anomalyollie.lua"))()
    assert(SMODS.load_file("jokers/2ascendedaces.lua"))()
    assert(SMODS.load_file("jokers/2binaryjoker.lua"))()
    assert(SMODS.load_file("jokers/2blueberrysmoothie.lua"))()
    assert(SMODS.load_file("jokers/2strawberrysmoothie.lua"))()
    assert(SMODS.load_file("jokers/2bonus.lua"))()
    assert(SMODS.load_file("jokers/2mult.lua"))()
    assert(SMODS.load_file("jokers/2boosterclearance.lua"))()
    assert(SMODS.load_file("jokers/2canvas.lua"))()
    assert(SMODS.load_file("jokers/2celestialcookie.lua"))()
    assert(SMODS.load_file("jokers/2magicalcookie.lua"))()
    assert(SMODS.load_file("jokers/2spectralcookie.lua"))()
    assert(SMODS.load_file("jokers/2chocolateicecream.lua"))()
    assert(SMODS.load_file("jokers/2colt.lua"))()
    assert(SMODS.load_file("jokers/2companycard.lua"))()
    assert(SMODS.load_file("jokers/2coolglasses.lua"))()
    assert(SMODS.load_file("jokers/2cadept.lua"))()
    assert(SMODS.load_file("jokers/2cascender.lua"))()
    assert(SMODS.load_file("jokers/2cfatesayer.lua"))()
    assert(SMODS.load_file("jokers/2cmerchant.lua"))()
    assert(SMODS.load_file("jokers/2cmessenger.lua"))()
    assert(SMODS.load_file("jokers/2cpriest.lua"))()
    assert(SMODS.load_file("jokers/2cthespian.lua"))()
    assert(SMODS.load_file("jokers/2cthief.lua"))()
    assert(SMODS.load_file("jokers/2cviscount.lua"))()
    assert(SMODS.load_file("jokers/2envelope.lua"))()
    assert(SMODS.load_file("jokers/2fairblair.lua"))()
    assert(SMODS.load_file("jokers/2hexcode.lua"))()
    assert(SMODS.load_file("jokers/2hotcoffee.lua"))()
    assert(SMODS.load_file("jokers/2huh.lua"))()
    assert(SMODS.load_file("jokers/2idolizingjoker.lua"))()
    assert(SMODS.load_file("jokers/2jackofalltrades.lua"))()
    assert(SMODS.load_file("jokers/2jackpot.lua"))()
    assert(SMODS.load_file("jokers/2kingbo.lua"))()
    assert(SMODS.load_file("jokers/2misfits.lua"))()
    assert(SMODS.load_file("jokers/2mondrian.lua"))()
    assert(SMODS.load_file("jokers/2outlier.lua"))()
    assert(SMODS.load_file("jokers/2paintbucket.lua"))()
    assert(SMODS.load_file("jokers/2psychedelia.lua"))()
    assert(SMODS.load_file("jokers/2reachthestars.lua"))()
    assert(SMODS.load_file("jokers/2royalclub.lua"))()
    assert(SMODS.load_file("jokers/2royaldiamond.lua"))()
    assert(SMODS.load_file("jokers/2royalheart.lua"))()
    assert(SMODS.load_file("jokers/2royalspade.lua"))()
    assert(SMODS.load_file("jokers/2sacrificialpair.lua"))()
    assert(SMODS.load_file("jokers/2screamingjimbo.lua"))()
    assert(SMODS.load_file("jokers/2shoppingcart.lua"))()
    assert(SMODS.load_file("jokers/2tempertemper.lua"))()
    assert(SMODS.load_file("jokers/2trashcan.lua"))()
    assert(SMODS.load_file("jokers/2twinmoons.lua"))()
    assert(SMODS.load_file("jokers/3unknown.lua"))()
    assert(SMODS.load_file("jokers/3fivesquared.lua"))()
    assert(SMODS.load_file("jokers/3amoeba.lua"))()
    assert(SMODS.load_file("jokers/3amr.lua"))()
    assert(SMODS.load_file("jokers/3bloodsoaked.lua"))()
    assert(SMODS.load_file("jokers/3crownjewelofavarice.lua"))()
    assert(SMODS.load_file("jokers/3onyxladenvoracity.lua"))()
    assert(SMODS.load_file("jokers/3twistedarrowofhatred.lua"))()
    assert(SMODS.load_file("jokers/3cargoplane.lua"))()
    assert(SMODS.load_file("jokers/3chaingun.lua"))()
    assert(SMODS.load_file("jokers/3creditssong.lua"))()
    assert(SMODS.load_file("jokers/3cbuffoon.lua"))()
    assert(SMODS.load_file("jokers/3cinitiator.lua"))()
    assert(SMODS.load_file("jokers/3cmagnate.lua"))()
    assert(SMODS.load_file("jokers/3cpathfinder.lua"))()
    assert(SMODS.load_file("jokers/3craider.lua"))()
    assert(SMODS.load_file("jokers/3dementia.lua"))()
    assert(SMODS.load_file("jokers/3errorjoker.lua"))()
    assert(SMODS.load_file("jokers/3eventhorizon.lua"))()
    assert(SMODS.load_file("jokers/3failsafe.lua"))()
    assert(SMODS.load_file("jokers/3fakepng.lua"))()
    assert(SMODS.load_file("jokers/3firstaidkit.lua"))()
    assert(SMODS.load_file("jokers/3fridge.lua"))()
    assert(SMODS.load_file("jokers/3gilded.lua"))()
    assert(SMODS.load_file("jokers/3horse.lua"))()
    assert(SMODS.load_file("jokers/3incropera.lua"))()
    assert(SMODS.load_file("jokers/3intruder.lua"))()
    assert(SMODS.load_file("jokers/3kalashnikov.lua"))()
    assert(SMODS.load_file("jokers/3karbit.lua"))()
    assert(SMODS.load_file("jokers/3kingme.lua"))()
    assert(SMODS.load_file("jokers/3kingslayer.lua"))()
    assert(SMODS.load_file("jokers/3kissspam.lua"))()
    assert(SMODS.load_file("jokers/1lonewolf.lua"))()
    assert(SMODS.load_file("jokers/3lotterycard.lua"))()
    assert(SMODS.load_file("jokers/3luckiercards.lua"))()
    assert(SMODS.load_file("jokers/3masterchallenge.lua"))()
    assert(SMODS.load_file("jokers/3membership.lua"))()
    assert(SMODS.load_file("jokers/3midastouch.lua"))()
    assert(SMODS.load_file("jokers/3mirror.lua"))()
    assert(SMODS.load_file("jokers/3omnicard.lua"))()
    assert(SMODS.load_file("jokers/3onemorecard.lua"))()
    assert(SMODS.load_file("jokers/3phoenixpackage.lua"))()
    assert(SMODS.load_file("jokers/3photochad.lua"))()
    assert(SMODS.load_file("jokers/3plusone.lua"))()
    assert(SMODS.load_file("jokers/3prima.lua"))()
    assert(SMODS.load_file("jokers/3prospector.lua"))()
    assert(SMODS.load_file("jokers/3redking.lua"))()
    assert(SMODS.load_file("jokers/3rendang.lua"))()
    assert(SMODS.load_file("jokers/3rexar.lua"))()
    assert(SMODS.load_file("jokers/3schematic.lua"))()
    assert(SMODS.load_file("jokers/3sixshooter.lua"))()
    assert(SMODS.load_file("jokers/3slotmachine.lua"))()
    assert(SMODS.load_file("jokers/3social.lua"))()
    assert(SMODS.load_file("jokers/3souvenirshop.lua"))()
    assert(SMODS.load_file("jokers/3starsaligned.lua"))()
    assert(SMODS.load_file("jokers/3starsage.lua"))()
    assert(SMODS.load_file("jokers/3studentcard.lua"))()
    assert(SMODS.load_file("jokers/3survey.lua"))()
    assert(SMODS.load_file("jokers/3synthetica.lua"))()
    assert(SMODS.load_file("jokers/3themajor.lua"))()
    assert(SMODS.load_file("jokers/3charlieinferno.lua"))()
    assert(SMODS.load_file("jokers/3unlonely.lua"))()
    assert(SMODS.load_file("jokers/3crimsonskies.lua"))()
    assert(SMODS.load_file("jokers/3vipjoker.lua"))()
    assert(SMODS.load_file("jokers/3virtuoso.lua"))()
    assert(SMODS.load_file("jokers/3voucherclearance.lua"))()
    assert(SMODS.load_file("jokers/3wheeloffate.lua"))()
    assert(SMODS.load_file("jokers/3wifirouter.lua"))()
    assert(SMODS.load_file("jokers/4avarizio.lua"))()
    assert(SMODS.load_file("jokers/4devaniaaura.lua"))()
    assert(SMODS.load_file("jokers/4fukulian.lua"))()
    assert(SMODS.load_file("jokers/4kantamiyamoto.lua"))()
    assert(SMODS.load_file("jokers/4kuromizukouki.lua"))()
    assert(SMODS.load_file("jokers/4serikacosmica.lua"))()
    assert(SMODS.load_file("jokers/4thalia.lua"))()
    assert(SMODS.load_file("jokers/4adinfinitum.lua"))()
    assert(SMODS.load_file("jokers/4rom.lua"))()
end
-- load the consumables
if true then
    assert(SMODS.load_file("consumables/wajik.lua"))()
    assert(SMODS.load_file("consumables/keriting.lua"))()
    assert(SMODS.load_file("consumables/hati.lua"))()
    assert(SMODS.load_file("consumables/waru.lua"))()
    assert(SMODS.load_file("consumables/idolatry.lua"))()
    assert(SMODS.load_file("consumables/inception.lua"))()
    assert(SMODS.load_file("consumables/theswan.lua"))()
end
-- load the enhancements
if true then
    assert(SMODS.load_file("enhancements/idolmark.lua"))()
end

-- load the vouchers
if true then
    assert(SMODS.load_file("vouchers/quality_goods.lua"))()
    assert(SMODS.load_file("vouchers/priority_items.lua"))()
    assert(SMODS.load_file("vouchers/bigger_boosters.lua"))()
    assert(SMODS.load_file("vouchers/overboost.lua"))()
    assert(SMODS.load_file("vouchers/sixth_finger.lua"))()
    assert(SMODS.load_file("vouchers/hand_mutation.lua"))()
    assert(SMODS.load_file("vouchers/shelf_extension.lua"))()
    assert(SMODS.load_file("vouchers/store_renovation.lua"))()
    assert(SMODS.load_file("vouchers/bigger_blinds.lua"))()
    assert(SMODS.load_file("vouchers/cruel_blinds.lua"))()
    assert(SMODS.load_file("vouchers/wanderer.lua"))()
    assert(SMODS.load_file("vouchers/journeyman.lua"))()
end

-- load the decks
if true then
    assert(SMODS.load_file("decks/brown_deck.lua"))()
    assert(SMODS.load_file("decks/cream_deck.lua"))()
    assert(SMODS.load_file("decks/neon_deck.lua"))()
    assert(SMODS.load_file("decks/mashup_deck.lua"))()
    assert(SMODS.load_file("decks/swirl_deck.lua"))()
    assert(SMODS.load_file("decks/legendary_deck.lua"))()
    assert(SMODS.load_file("decks/golden_deck.lua"))()
end


-- load boosters
assert(SMODS.load_file("boosters.lua"))()
--load sounds
assert(SMODS.load_file("sounds.lua"))()
SMODS.ObjectType({
    key = "nx_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true,
        ["j_nx_2blueberrysmoothie"] = true,
        ["j_nx_2strawberrysmoothie"] = true,
        ["j_nx_2celestialcookie"] = true,
        ["j_nx_2magicalcookie"] = true,
        ["j_nx_2spectralcookie"] = true,
        ["j_nx_2hotcoffee"] = true,
        ["j_nx_3rendang"] = true
    },
})

SMODS.ObjectType({
    key = "nx_nx_jokers",
    cards = {
        ["j_nx_1bottlecaps"] = true,
        ["j_nx_1catalyst"] = true,
        ["j_nx_1chastejester"] = true,
        ["j_nx_1generousjester"] = true,
        ["j_nx_1patientjester"] = true,
        ["j_nx_1temperatejester"] = true,
        ["j_nx_1classification"] = true,
        ["j_nx_1czealot"] = true,
        ["j_nx_1e4rth"] = true,
        ["j_nx_1jup1ter"] = true,
        ["j_nx_1s4turn"] = true,
        ["j_nx_1emptyjester"] = true,
        ["j_nx_1fivefingerdiscount"] = true,
        ["j_nx_1jestertemplate"] = true,
        ["j_nx_1missingtexture"] = true,
        ["j_nx_1monker"] = true,
        ["j_nx_1nonumbers"] = true,
        ["j_nx_1patternrecognition"] = true,
        ["j_nx_1sieve"] = true,
        ["j_nx_1stampbook"] = true,
        ["j_nx_1supplydrop"] = true,
        ["j_nx_1wipjoker"] = true,
        ["j_nx_2allrounder"] = true,
        ["j_nx_2anomalyollie"] = true,
        ["j_nx_2ascendedaces"] = true,
        ["j_nx_2binaryjoker"] = true,
        ["j_nx_2blueberrysmoothie"] = true,
        ["j_nx_2strawberrysmoothie"] = true,
        ["j_nx_2bonus"] = true,
        ["j_nx_2mult"] = true,
        ["j_nx_2boosterclearance"] = true,
        ["j_nx_2canvas"] = true,
        ["j_nx_2celestialcookie"] = true,
        ["j_nx_2magicalcookie"] = true,
        ["j_nx_2spectralcookie"] = true,
        ["j_nx_2chocolateicecream"] = true,
        ["j_nx_2colt"] = true,
        ["j_nx_2companycard"] = true,
        ["j_nx_2coolglasses"] = true,
        ["j_nx_2cadept"] = true,
        ["j_nx_2cascender"] = true,
        ["j_nx_2cfatesayer"] = true,
        ["j_nx_2cmerchant"] = true,
        ["j_nx_2cpriest"] = true,
        ["j_nx_2cthespian"] = true,
        ["j_nx_2cthief"] = true,
        ["j_nx_2cviscount"] = true,
        ["j_nx_2envelope"] = true,
        ["j_nx_2fairblair"] = true,
        ["j_nx_2hexcode"] = true,
        ["j_nx_2hotcoffee"] = true,
        ["j_nx_2huh"] = true,
        ["j_nx_2idolizingjoker"] = true,
        ["j_nx_2jackofalltrades"] = true,
        ["j_nx_2jackpot"] = true,
        ["j_nx_2kingbo"] = true,
        ["j_nx_2misfits"] = true,
        ["j_nx_2mondrian"] = true,
        ["j_nx_2outlier"] = true,
        ["j_nx_2paintbucket"] = true,
        ["j_nx_2psychedelia"] = true,
        ["j_nx_2reachthestars"] = true,
        ["j_nx_2royalclub"] = true,
        ["j_nx_2royaldiamond"] = true,
        ["j_nx_2royalheart"] = true,
        ["j_nx_2royalspade"] = true,
        ["j_nx_2sacrificialpair"] = true,
        ["j_nx_2screamingjimbo"] = true,
        ["j_nx_2shoppingcart"] = true,
        ["j_nx_2tempertemper"] = true,
        ["j_nx_2trashcan"] = true,
        ["j_nx_2twinmoons"] = true,
        ["j_nx_3unknown"] = true,
        ["j_nx_3amoeba"] = true,
        ["j_nx_3amr"] = true,
        ["j_nx_3bloodsoaked"] = true,
        ["j_nx_3crownjewelofavarice"] = true,
        ["j_nx_3onyxladenvoracity"] = true,
        ["j_nx_3twistedarrowofhatred"] = true,
        ["j_nx_3cargoplane"] = true,
        ["j_nx_3chaingun"] = true,
        ["j_nx_3creditssong"] = true,
        ["j_nx_3cbuffoon"] = true,
        ["j_nx_3cinitiator"] = true,
        ["j_nx_3cmagnate"] = true,
        ["j_nx_3cpathfinder"] = true,
        ["j_nx_3craider"] = true,
        ["j_nx_3dementia"] = true,
        ["j_nx_3errorjoker"] = true,
        ["j_nx_3eventhorizon"] = true,
        ["j_nx_3failsafe"] = true,
        ["j_nx_3fakepng"] = true,
        ["j_nx_3firstaidkit"] = true,
        ["j_nx_3fridge"] = true,
        ["j_nx_3gilded"] = true,
        ["j_nx_3horse"] = true,
        ["j_nx_3incropera"] = true,
        ["j_nx_3intruder"] = true,
        ["j_nx_3kalashnikov"] = true,
        ["j_nx_3karbit"] = true,
        ["j_nx_3kingme"] = true,
        ["j_nx_3kingslayer"] = true,
        ["j_nx_3kissspam"] = true,
        ["j_nx_1lonewolf"] = true,
        ["j_nx_3lotterycard"] = true,
        ["j_nx_3luckiercards"] = true,
        ["j_nx_3masterchallenge"] = true,
        ["j_nx_3membership"] = true,
        ["j_nx_3midastouch"] = true,
        ["j_nx_3mirror"] = true,
        ["j_nx_3omnicard"] = true,
        ["j_nx_3onemorecard"] = true,
        ["j_nx_3phoenixpackage"] = true,
        ["j_nx_3photochad"] = true,
        ["j_nx_3plusone"] = true,
        ["j_nx_3prima"] = true,
        ["j_nx_3prospector"] = true,
        ["j_nx_3redking"] = true,
        ["j_nx_3rendang"] = true,
        ["j_nx_3rexar"] = true,
        ["j_nx_3schematic"] = true,
        ["j_nx_3sixshooter"] = true,
        ["j_nx_3slotmachine"] = true,
        ["j_nx_3social"] = true,
        ["j_nx_3souvenirshop"] = true,
        ["j_nx_3starsaligned"] = true,
        ["j_nx_3starsage"] = true,
        ["j_nx_3studentcard"] = true,
        ["j_nx_3survey"] = true,
        ["j_nx_3synthetica"] = true,
        ["j_nx_3themajor"] = true,
        ["j_nx_3charlieinferno"] = true,
        ["j_nx_3unlonely"] = true,
        ["j_nx_3crimsonskies"] = true,
        ["j_nx_3vipjoker"] = true,
        ["j_nx_3virtuoso"] = true,
        ["j_nx_3voucherclearance"] = true,
        ["j_nx_3wheeloffate"] = true,
        ["j_nx_3wifirouter"] = true,
        ["j_nx_4avarizio"] = true,
        ["j_nx_4devaniaaura"] = true,
        ["j_nx_4fukulian"] = true,
        ["j_nx_4kantamiyamoto"] = true,
        ["j_nx_4kuromizukouki"] = true,
        ["j_nx_4serikacosmica"] = true,
        ["j_nx_4thalia"] = true,
        ["j_nx_4adinfinitum"] = true,
        ["j_nx_4rom"] = true
    },
})

SMODS.ObjectType({
    key = "nx_suit_jesters",
    cards = {
        ["j_nx_1chastejester"] = true,
        ["j_nx_1generousjester"] = true,
        ["j_nx_1patientjester"] = true,
        ["j_nx_1temperatejester"] = true
    },
})

SMODS.ObjectType({
    key = "nx_cult",
    cards = {
        ["j_nx_2cadept"] = true,
        ["j_nx_2cascender"] = true,
        ["j_nx_2cfatesayer"] = true,
        ["j_nx_2cmerchant"] = true,
        ["j_nx_2cmessenger"] = true,
        ["j_nx_2cpriest"] = true,
        ["j_nx_2cthespian"] = true,
        ["j_nx_2cthief"] = true,
        ["j_nx_2cviscount"] = true,
        ["j_nx_3cbuffoon"] = true,
        ["j_nx_3cinitiator"] = true,
        ["j_nx_3cmagnate"] = true,
        ["j_nx_3cpathfinder"] = true,
        ["j_nx_3craider"] = true
    },
})

SMODS.ObjectType({
    key = "nx_bzlegends",
    cards = {
        ["j_nx_4avarizio"] = true,
        ["j_nx_4devaniaaura"] = true,
        ["j_nx_4kantamiyamoto"] = true,
        ["j_nx_4kuromizukouki"] = true,
        ["j_nx_4serikacosmica"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {},
        post_trigger = true 
    }
end

SMODS.current_mod.menu_cards = function()
	return {
		{key = 'j_nx_4avarizio'},
	}
end