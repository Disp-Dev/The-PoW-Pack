--- STEAMODDED HEADER
--- MOD_NAME: The PoW Pack
--- MOD_ID: hmspow_jokers
--- PREFIX: hmspowjokers
--- MOD_AUTHOR: [Dispenser]
--- MOD_DESCRIPTION: A bunch of inside jokes and dumb shit in a (hopefully) vanilla-styled mod!
----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas {
    key = "modicon",
    path = "mod_icon.png",
    px = 34,
    py = 34,
}

SMODS.Atlas{
	key = 'Jokers',
	path = 'Jokers.png',
	px = 71,
	py = 95,
}

-- load all individual jokers
local subdir = "cards"
local cards = NFS.getDirectoryItems(SMODS.current_mod.path .. subdir)
for _, filename in pairs(cards) do
    assert(SMODS.load_file(subdir .. "/" .. filename))()
end

local atlas_key = 'hmspowjokers_atlas' -- Format: PREFIX_KEY
-- See end of file for notes
local atlas_path = 'hmspow.png' -- Filename for the image in the asset folder

local suits = {'hearts', 'clubs', 'diamonds', 'spades'} -- Which suits to replace
local ranks = {'Jack', 'Queen', "King"} -- Which ranks to replace

local description = 'The PoW Pack' -- English-language description, also used as default

SMODS.Atlas{  
    key = atlas_key..'_lc',
    px = 71,
    py = 95,
    path = atlas_path,
    prefix_config = {key = false}, -- See end of file for notes
}

if atlas_path_hc then
    SMODS.Atlas{  
        key = atlas_key..'_hc',
        px = 71,
        py = 95,
        path = atlas_path_hc,
        prefix_config = {key = false}, -- See end of file for notes
    }
end

for _, suit in ipairs(suits) do
    SMODS.DeckSkin{
        key = suit.."_skin",
        suit = suit:gsub("^%l", string.upper),
        ranks = ranks,
        lc_atlas = atlas_key..'_lc',
        hc_atlas = (atlas_path_hc and atlas_key..'_hc') or atlas_key..'_lc',
        loc_txt = {
            ['en-us'] = description
        },
        posStyle = 'deck'
    }
end



----------------------------------------------
------------MOD CODE END----------------------
   