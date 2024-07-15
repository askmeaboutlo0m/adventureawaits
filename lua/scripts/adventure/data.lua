-- Copyright (c) 2020 askmeaboutloom
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

-- This was originally auto-generated Haxe code. That's been transformed to Lua
-- semi-automatically. I know it's ugly, don't hate me please or I'll cry.

local Data = {}


Data.Thing = class()

function Data.Thing:init(id, name, inv, aliases, verbs)
    self.id      = id
    self.name    = name
    self.inv     = inv
    self.aliases = aliases
    self.verbs   = verbs
end

function Data.Thing:like(noun)
    for i, alias in ipairs(self.aliases) do
        if alias == noun then
            return true
        end
    end
    return false
end

function Data.Thing:resolve(verb)
    return self.verbs and self.verbs[verb] or verb
end

Data.things = {
    _bladeInTable = Data.Thing.new(
        "_bladeInTable",
        "_BLADEINTABLE",
        "_BLADEINTABLE",
        {
            "_bladeintable",
            "blade",
        },
        {
            ["pull"] = "take",
        }),

    _emptyMachine = Data.Thing.new(
        "_emptyMachine",
        "_EMPTYMACHINE",
        "_EMPTYMACHINE",
        {
            "_emptymachine",
            "machine",
            "vendingmachine",
            "vendor",
        },
        {
            ["use"] = "look",
        }),

    _fixedPipes = Data.Thing.new(
        "_fixedPipes",
        "_FIXEDPIPES",
        "_FIXEDPIPES",
        {
            "_fixedpipes",
            "bubblegum",
            "chewinggum",
            "gum",
            "hole",
            "hydraulic",
            "hydraulicpipe",
            "hydraulicpipes",
            "hydraulics",
            "mechanism",
            "nail",
            "pin",
            "pipe",
            "pipes",
            "softchewinggum",
            "softgum",
            "tack",
            "wad",
        },
        {
            ["block"] = "use",
            ["shut"] = "use",
            ["fix"] = "use",
            ["close"] = "use",
            ["remove"] = "take",
            ["hold"] = "use",
        }),

    _gumPipes = Data.Thing.new(
        "_gumPipes",
        "_GUMPIPES",
        "_GUMPIPES",
        {
            "_gumpipes",
            "bubblegum",
            "chewinggum",
            "gum",
            "hole",
            "hydraulic",
            "hydraulicpipe",
            "hydraulicpipes",
            "hydraulics",
            "mechanism",
            "pipe",
            "pipes",
            "softchewinggum",
            "softgum",
            "wad",
        },
        {
            ["hold"] = "use",
            ["shut"] = "use",
            ["block"] = "use",
            ["fix"] = "use",
            ["close"] = "use",
            ["remove"] = "take",
        }),

    _holePipes = Data.Thing.new(
        "_holePipes",
        "_HOLEPIPES",
        "_HOLEPIPES",
        {
            "_holepipes",
            "hole",
            "hydraulic",
            "hydraulicpipe",
            "hydraulicpipes",
            "hydraulics",
            "mechanism",
            "pipe",
            "pipes",
        },
        {
            ["remove"] = "take",
            ["close"] = "use",
            ["fix"] = "use",
            ["block"] = "use",
            ["shut"] = "use",
            ["hold"] = "use",
        }),

    _jerkyInMachine = Data.Thing.new(
        "_jerkyInMachine",
        "_JERKYINMACHINE",
        "_JERKYINMACHINE",
        {
            "_jerkyinmachine",
            "bag",
            "beef",
            "beefjerky",
            "jerky",
        },
        {
            ["buy"] = "take",
        }),

    _nailInWall = Data.Thing.new(
        "_nailInWall",
        "_NAILINWALL",
        "_NAILINWALL",
        {
            "_nailinwall",
            "nail",
            "pin",
            "tack",
        },
        {
            ["pull"] = "take",
            ["use"] = "take",
            ["reach"] = "take",
        }),

    _nailPipes = Data.Thing.new(
        "_nailPipes",
        "_NAILPIPES",
        "_NAILPIPES",
        {
            "_nailpipes",
            "hole",
            "hydraulic",
            "hydraulicpipe",
            "hydraulicpipes",
            "hydraulics",
            "mechanism",
            "nail",
            "pin",
            "pipe",
            "pipes",
            "tack",
        },
        {
            ["hold"] = "use",
            ["remove"] = "take",
            ["close"] = "use",
            ["fix"] = "use",
            ["block"] = "use",
            ["shut"] = "use",
        }),

    altar = Data.Thing.new(
        "altar",
        "ALTAR",
        "ALTAR",
        {
            "altar",
            "alter",
        },
        {
            ["move"] = "take",
            ["sit"] = "use",
            ["push"] = "take",
            ["climb"] = "use",
            ["shove"] = "take",
            ["pull"] = "take",
            ["open"] = "take",
            ["drag"] = "take",
            ["sleep"] = "use",
            ["lay"] = "use",
        }),

    ash = Data.Thing.new(
        "ash",
        "ASH",
        "ASH stuck all over everything",
        {
            "ash",
            "ashes",
        },
        nil),

    blade = Data.Thing.new(
        "blade",
        "BLADE",
        "a dull BLADE",
        {
            "blade",
        },
        {
            ["hold"] = "take",
            ["use"] = "take",
            ["equip"] = "take",
            ["wield"] = "take",
        }),

    bossRoom = Data.Thing.new(
        "bossRoom",
        "BOSSROOM",
        "",
        {
            "bossroom",
        },
        {
            ["take"] = "go",
            ["use"] = "go",
        }),

    bowflex = Data.Thing.new(
        "bowflex",
        "BOWFLEX",
        "BOWFLEX",
        {
            "bow",
            "bowflex",
            "bowflexrevolution",
            "bowflexrevolutionworkoutequipment",
            "equip",
            "equipment",
            "flex",
            "gym",
            "gymsystem",
            "homegym",
            "homegymsystem",
            "machine",
            "pulley",
            "pulleys",
            "system",
            "weight",
            "weights",
            "workout",
            "workoutequipment",
        },
        {
            ["pull"] = "use",
            ["lift"] = "use",
            ["tug"] = "use",
            ["yank"] = "use",
        }),

    brokenGlasses = Data.Thing.new(
        "brokenGlasses",
        "BROKENGLASSES",
        "BROKENGLASSES",
        {
            "brokenglasses",
            "glass",
            "glasses",
        },
        {
            ["use"] = "take",
        }),

    cafeteria = Data.Thing.new(
        "cafeteria",
        "CAFETERIA",
        "",
        {
            "cafe",
            "cafeteria",
            "vendeteria",
        },
        {
            ["take"] = "go",
            ["use"] = "go",
        }),

    ceiling = Data.Thing.new(
        "ceiling",
        "CEILING",
        "",
        {
            "ceiling",
            "roof",
        },
        nil),

    chewingGum = Data.Thing.new(
        "chewingGum",
        "CHEWINGGUM",
        "CHEWINGGUM",
        {
            "bubblegum",
            "chewinggum",
            "gum",
            "wad",
        },
        {
            ["chew"] = "use",
            ["eat"] = "use",
        }),

    clapper = Data.Thing.new(
        "clapper",
        "CLAPPER",
        "CLAPPER",
        {
            "bulb",
            "clapper",
            "lamp",
            "light",
            "lightbulb",
        },
        nil),

    clothes = Data.Thing.new(
        "clothes",
        "CLOTHES",
        "the CLOTHES you're wearing",
        {
            "clothes",
            "clothing",
            "trousers",
            "trouser",
            "pants",
            "shirt",
        },
        {
            ["drop"] = "take",
            ["rip"] = "take",
            ["tear"] = "take",
            ["pull"] = "take",
            ["undress"] = "take",
            ["remove"] = "take",
            ["divest"] = "take",
        }),

    dragon = Data.Thing.new(
        "dragon",
        "DRAGON",
        "DRAGON",
        {
            "boss",
            "claw",
            "claws",
            "creature",
            "dragon",
            "drake",
            "eyes",
            "fred",
            "friend",
            "friends",
            "glasses",
            "maw",
            "monster",
            "mouth",
            "nose",
            "nostrils",
            "paw",
            "paws",
            "smoke",
            "tail",
            "teeth",
            "wyrm",
        },
        {
            ["touch"] = "use",
            ["hit"] = "take",
            ["take"] = "use",
            ["ask"] = "talk",
            ["hug"] = "use",
            ["smooch"] = "use",
            ["make"] = "talk",
            ["kiss"] = "use",
            ["greet"] = "talk",
            ["encourage"] = "talk",
            ["murder"] = "take",
            ["attack"] = "take",
            ["flirt"] = "talk",
            ["sup"] = "talk",
            ["wrestle"] = "take",
            ["pick"] = "use",
            ["tame"] = "climb",
            ["fight"] = "take",
            ["ride"] = "climb",
            ["kill"] = "take",
            ["get"] = "use",
            ["use"] = "climb",
            ["hello"] = "talk",
            ["hi"] = "talk",
            ["yiff"] = "use",
            ["befriend"] = "talk",
        }),

    dressShirt = Data.Thing.new(
        "dressShirt",
        "DRESSSHIRT",
        "DRESSSHIRT",
        {
            "card",
            "dress",
            "dressshirt",
            "greeting",
            "greetingcard",
            "shirt",
            "suit",
            "tie",
        },
        nil),

    exitDoor = Data.Thing.new(
        "exitDoor",
        "EXITDOOR",
        "EXITDOOR",
        {
            "door",
            "exit",
            "exitdoor",
        },
        {
            ["open"] = "use",
            ["go"] = "use",
        }),

    fire = Data.Thing.new(
        "fire",
        "FIRE",
        "FIRE",
        {
            "basket",
            "bin",
            "can",
            "dustbin",
            "fire",
            "flames",
            "garbagecan",
            "shiny",
            "shinything",
            "thing",
            "wastepaperbasket",
        },
        {
            ["extinguish"] = "use",
            ["douse"] = "use",
            ["put"] = "use",
            ["smother"] = "use",
        }),

    floor = Data.Thing.new(
        "floor",
        "FLOOR",
        "",
        {
            "earth",
            "floor",
            "floors",
            "ground",
        },
        {
            ["use"] = "stand",
        }),

    flute = Data.Thing.new(
        "flute",
        "FLUTE",
        "a bulbous FLUTE",
        {
            "bong",
            "flute",
            "pipe",
        },
        {
            ["blow"] = "use",
            ["play"] = "use",
            ["draw"] = "use",
            ["smoke"] = "use",
        }),

    greenFlute = Data.Thing.new(
        "greenFlute",
        "GREENFLUTE",
        "a FLUTE stuffed with dry, green WEEDS",
        {
            "bong",
            "flute",
            "greenflute",
            "pipe",
            "weedeveryday",
            "weeds",
            "weed",
            "greenweeds",
        },
        {
            ["empty"] = "take",
            ["play"] = "use",
            ["blow"] = "use",
            ["draw"] = "use",
            ["smoke"] = "use",
        }),

    greenWeeds = Data.Thing.new(
        "greenWeeds",
        "GREENWEEDS",
        "a stash of dry, green WEEDS",
        {
            "greenweeds",
            "weed",
            "weeds",
        },
        {
            ["smoke"] = "use",
        }),

    greetingCard = Data.Thing.new(
        "greetingCard",
        "GREETINGCARD",
        "a GREETING CARD",
        {
            "card",
            "greeting",
            "greetingcard",
        },
        {
            ["open"] = "look",
            ["read"] = "look",
        }),

    hands = Data.Thing.new(
        "hands",
        "HANDS",
        "",
        {
            "barehand",
            "barehands",
            "hand",
            "hands",
        },
        {
            ["equip"] = "take",
            ["wield"] = "take",
            ["hold"] = "take",
            ["clap"] = "use",
        }),

    hardGum = Data.Thing.new(
        "hardGum",
        "HARDGUM",
        "an old, hard wad of CHEWING GUM",
        {
            "bubblegum",
            "chewinggum",
            "gum",
            "hardchewinggum",
            "hardgum",
            "wad",
        },
        {
            ["use"] = "eat",
            ["chew"] = "eat",
            ["take"] = "eat",
        }),

    jerky = Data.Thing.new(
        "jerky",
        "JERKY",
        "a bag of original flavor BEEF JERKY",
        {
            "bag",
            "beef",
            "beefjerky",
            "jerky",
        },
        {
            ["open"] = "use",
            ["rip"] = "use",
            ["eat"] = "use",
        }),

    lever = Data.Thing.new(
        "lever",
        "LEVER",
        "LEVER",
        {
            "arm",
            "crank",
            "handle",
            "lever",
            "stick",
            "switch",
        },
        {
            ["push"] = "use",
            ["pull"] = "use",
            ["tug"] = "use",
            ["yank"] = "use",
            ["crank"] = "use",
            ["switch"] = "use",
        }),

    litGreenFlute = Data.Thing.new(
        "litGreenFlute",
        "LITGREENFLUTE",
        "a flute stuffed with smoldering green WEEDS",
        {
            "bong",
            "flute",
            "litgreenflute",
            "pipe",
            "weedeveryday",
            "weeds",
            "weed",
            "greenweeds",
        },
        {
            ["smoke"] = "use",
            ["empty"] = "take",
            ["play"] = "use",
            ["blow"] = "use",
            ["draw"] = "use",
        }),

    litYellowFlute = Data.Thing.new(
        "litYellowFlute",
        "LITYELLOWFLUTE",
        "a FLUTE stuffed with smoldering yellow WEEDS",
        {
            "bong",
            "flute",
            "lityellowflute",
            "pipe",
            "weedeveryday",
        },
        {
            ["empty"] = "take",
            ["blow"] = "use",
            ["play"] = "use",
            ["draw"] = "use",
            ["smoke"] = "use",
        }),

    nail = Data.Thing.new(
        "nail",
        "NAIL",
        "a large NAIL",
        {
            "nail",
            "pin",
            "tack",
        },
        {
            ["chew"] = "eat",
            ["bite"] = "eat",
        }),

    narrator = Data.Thing.new(
        "narrator",
        "NARRATOR",
        "",
        {
            "narator",
            "narrator",
            "storyteller",
            "voice",
        },
        {
            ["poke"] = "take",
            ["touch"] = "take",
            ["reach"] = "take",
            ["climb"] = "take",
            ["lick"] = "take",
        }),

    painting = Data.Thing.new(
        "painting",
        "PAINTING",
        "PAINTING",
        {
            "image",
            "painting",
            "picture",
        },
        {
            ["leap"] = "go",
            ["jump"] = "go",
            ["appreciate"] = "look",
            ["pull"] = "take",
        }),

    pants = Data.Thing.new(
        "pants",
        "PANTS",
        "your PANTS",
        {
            "pant",
            "pants",
            "shorts",
            "trouser",
            "trousers",
            "clothes",
            "rag",
        },
        {
            ["equip"] = "use",
            ["wear"] = "use",
            ["put"] = "use",
        }),

    plug = Data.Thing.new(
        "plug",
        "PLUG",
        "a makeshift PLUG",
        {
            "bubblegum",
            "chewinggum",
            "gum",
            "nail",
            "pin",
            "plug",
            "softchewinggum",
            "softgum",
            "tack",
            "wad",
        },
        {
            ["plug"] = "use",
            ["bite"] = "eat",
            ["chew"] = "eat",
        }),

    restroom = Data.Thing.new(
        "restroom",
        "RESTROOM",
        "",
        {
            "bathroom",
            "restroom",
            "toilet",
            "washroom",
        },
        {
            ["use"] = "go",
            ["take"] = "go",
        }),

    restroomdoor = Data.Thing.new(
        "restroomdoor",
        "RESTROOMDOOR",
        "RESTROOMDOOR",
        {
            "door",
            "restroomdoor",
        },
        {
            ["take"] = "go",
            ["use"] = "go",
            ["open"] = "go",
        }),

    restroomkey = Data.Thing.new(
        "restroomkey",
        "RESTROOMKEY",
        "a small, shiny KEY",
        {
            "key",
            "restroomkey",
            "shinykey",
            "smallkey",
            "smallshinykey",
        },
        nil),

    room = Data.Thing.new(
        "room",
        "ROOM",
        "",
        {
            "room",
        },
        nil),

    secretPassage = Data.Thing.new(
        "secretPassage",
        "SECRETPASSAGE",
        "",
        {
            "pass",
            "passage",
            "secret",
            "secretpass",
            "secretpassage",
            "stair",
            "stairs",
        },
        {
            ["take"] = "go",
            ["use"] = "go",
        }),

    self = Data.Thing.new(
        "self",
        "SELF",
        "YOURSELF",
        {
            "inventory",
            "myself",
            "self",
            "yourself",
        },
        nil),

    shiny = Data.Thing.new(
        "shiny",
        "SHINY THING",
        "SHINY",
        {
            "shiny",
            "shiny thing",
            "shinything",
            "thing",
        },
        nil),

    shirt = Data.Thing.new(
        "shirt",
        "SHIRT",
        "your SHIRT",
        {
            "shirt",
            "tshirt",
            "clothes",
            "cloth",
        },
        {
            ["wear"] = "use",
            ["put"] = "use",
            ["equip"] = "use",
        }),

    silicaGelPacket = Data.Thing.new(
        "silicaGelPacket",
        "SILICAGELPACKET",
        "a SILICA GEL PACKET",
        {
            "desiccant",
            "dessiccantgel",
            "dessiccantpacket",
            "gel",
            "gelpacket",
            "packet",
            "silica",
            "silicagel",
            "silicagelpacket",
            "silicapacket",
        },
        {
            ["lick"] = "smell",
            ["chew"] = "smell",
        }),

    slapChop = Data.Thing.new(
        "slapChop",
        "SLAPCHOP",
        "SLAPCHOP",
        {
            "button",
            "chopper",
            "junk",
            "slapchop",
            "slapchopper",
        },
        {
            ["whack"] = "use",
            ["hit"] = "use",
            ["push"] = "use",
            ["press"] = "use",
            ["slap"] = "use",
        }),

    softGum = Data.Thing.new(
        "softGum",
        "SOFTGUM",
        "the soft CHEWING GUM that you're chewing",
        {
            "bubblegum",
            "chewinggum",
            "gum",
            "softchewinggum",
            "softgum",
            "wad",
        },
        {
            ["use"] = "eat",
            ["chew"] = "eat",
            ["take"] = "eat",
        }),

    soot = Data.Thing.new(
        "soot",
        "SOOT",
        "SOOT",
        {
            "basket",
            "bin",
            "can",
            "dustbin",
            "garbagecan",
            "shiny",
            "shinything",
            "soot",
            "thing",
            "wastepaperbasket",
        },
        {
            ["sift"] = "take",
            ["search"] = "take",
            ["find"] = "take",
        }),

    souvenierShop = Data.Thing.new(
        "souvenierShop",
        "SOUVENIERSHOP",
        "",
        {
            "shop",
            "souveneirshop",
            "souveniershop",
            "souvenirshop",
            "store",
            "suveniershop",
            "suvenirshop",
        },
        {
            ["use"] = "go",
            ["take"] = "go",
        }),

    sparks = Data.Thing.new(
        "sparks",
        "SPARKS",
        "SPARKS",
        {
            "electricity",
            "spark",
            "sparks",
        },
        {
            ["take"] = "use",
            ["touch"] = "use",
        }),

    stairs = Data.Thing.new(
        "stairs",
        "STAIRS",
        "STAIRS",
        {
            "door",
            "exit",
            "stairs",
        },
        {
            ["take"] = "go",
            ["use"] = "go",
        }),

    statue = Data.Thing.new(
        "statue",
        "STATUE",
        "STATUE",
        {
            "bard",
            "bardstatue",
            "statue",
        },
        nil),

    table = Data.Thing.new(
        "table",
        "TABLE",
        "TABLE",
        {
            "table",
        },
        {
            ["stand"] = "climb",
        }),

    temple = Data.Thing.new(
        "temple",
        "TEMPLE",
        "",
        {
            "chapel",
            "church",
            "door",
            "exit",
            "tempel",
            "temple",
        },
        {
            ["use"] = "go",
            ["take"] = "go",
        }),

    toilet = Data.Thing.new(
        "toilet",
        "TOILET",
        "TOILET",
        {
            "bowl",
            "loo",
            "toilet",
            "water",
        },
        {
            ["piss"] = "use",
            ["sit"] = "use",
            ["poop"] = "use",
            ["go"] = "use",
            ["pee"] = "use",
            ["flush"] = "use",
        }),

    trash = Data.Thing.new(
        "trash",
        "TRASH",
        "TRASH",
        {
            "garbage",
            "trash",
            "waste",
        },
        nil),

    trashcan = Data.Thing.new(
        "trashcan",
        "TRASHCAN",
        "TRASHCAN",
        {
            "basket",
            "bin",
            "can",
            "dustbin",
            "garbagecan",
            "trashcan",
            "wastepaperbasket",
        },
        nil),

    twentyDollars = Data.Thing.new(
        "twentyDollars",
        "TWENTYDOLLARS",
        "the TWENTY DOLLARS you took out of the card",
        {
            "bill",
            "bloodmoney",
            "bucks",
            "dollar",
            "dollars",
            "money",
            "twenty",
            "twentybucks",
            "twentydollars",
        },
        nil),

    vendingMachine = Data.Thing.new(
        "vendingMachine",
        "VENDINGMACHINE",
        "VENDINGMACHINE",
        {
            "display",
            "funnel",
            "machine",
            "slot",
            "vendingmachine",
            "vendor",
        },
        {
            ["shake"] = "use",
            ["take"] = "use",
        }),

    wall = Data.Thing.new(
        "wall",
        "WALL",
        "",
        {
            "tile",
            "tiles",
            "wall",
            "walls",
        },
        nil),

    wetFlute = Data.Thing.new(
        "wetFlute",
        "WETFLUTE",
        "a FLUTE stuffed with wet, green WEEDS",
        {
            "bong",
            "flute",
            "pipe",
            "wetflute",
            "weedeveryday",
        },
        {
            ["smoke"] = "use",
            ["draw"] = "use",
            ["play"] = "use",
            ["empty"] = "take",
            ["blow"] = "use",
        }),

    wetWeeds = Data.Thing.new(
        "wetWeeds",
        "WETWEEDS",
        "a wad of wet, green WEEDS",
        {
            "weed",
            "weeds",
            "wetweeds",
        },
        {
            ["smoke"] = "use",
        }),

    wetcloth = Data.Thing.new(
        "wetcloth",
        "WET CLOTH",
        "a WET CLOTH that used to be your SHIRT",
        {
            "cloth",
            "shirt",
            "tshirt",
            "wet cloth",
            "wetcloth",
        },
        nil),

    wetrag = Data.Thing.new(
        "wetrag",
        "WET RAG",
        "a WET RAG that used to be your PANTS",
        {
            "pant",
            "pants",
            "rag",
            "shorts",
            "trouser",
            "trousers",
            "wet rag",
            "wetrag",
        },
        nil),

    yellowFlute = Data.Thing.new(
        "yellowFlute",
        "YELLOWFLUTE",
        "a FLUTE stuffed with dried yellow WEEDS",
        {
            "bong",
            "flute",
            "pipe",
            "yellowflute",
            "weedeveryday",
        },
        {
            ["smoke"] = "use",
            ["empty"] = "take",
            ["play"] = "use",
            ["blow"] = "use",
            ["draw"] = "use",
        }),

    yellowWeeds = Data.Thing.new(
        "yellowWeeds",
        "YELLOWWEEDS",
        "a bunch of dry, yellow WEEDS",
        {
            "weed",
            "weeds",
            "yellowweeds",
        },
        {
            ["smoke"] = "use",
            ["pull"] = "take",
        }),
}


Data.Room = class()

function Data.Room:init()
    self.things = {}
    self:add_all(self.THINGS)
end

function Data.Room:index_of(key)
    for i, thing in ipairs(self.things) do
        if thing.id == key then
            return i
        end
    end
    return 0
end

function Data.Room:has(key)
    return self:index_of(key) > 0
end

function Data.Room:find(noun)
    for i, thing in ipairs(self.things) do
        if thing:like(noun) then
            return thing
        end
    end
    return nil
end

function Data.Room:add(key)
    if self:has(key) then
        return false
    else
        table.insert(self.things, Data.things[key])
        return true
    end
end

function Data.Room:add_all(keys)
    for i, key in ipairs(keys) do
        self:add(key)
    end
end

function Data.Room:remove(key)
    local i = self:index_of(key)
    if i > 0 then
        table.remove(self.things, i)
        return true
    else
        return false
    end
end

function Data.Room:look()
    local bullets = {}
    for i, thing in ipairs(things) do
        table.insert(bullets, "- " .. thing.name)
    end
    return table.concat(bullets, "\n")
end


Data.Inventory = class(Data.Room)

Data.Inventory.THINGS = {"self", "clothes", "restroom", "hands", "room",
                         "floor", "ceiling", "wall", "narrator"}

function Data.Inventory:look()
    local names = {}
    for i, thing in ipairs(self.things) do
        if thing.inv and #thing.inv > 0 then
            table.insert(names, thing.inv)
        end
    end

    if #names == 0 then
        return "You have nothing, not even yourself!"
    elseif #names == 1 then
        return "You have only " .. names[1] .. "."
    else
        local last = table.remove(names)
        return "You have " .. table.concat(names, ", ") .. " and " .. last .. "."
    end
end


Data.RestRoom = class(Data.Room)

Data.RestRoom.THINGS = {"toilet", "trashcan", "shiny", "restroomdoor"}

function Data.RestRoom:look()
    local parts = {}
    table.insert(parts, "You're in a small room covered in white tile.")

    if not self.visited then
        table.insert(parts, "You're not sure how you got here.")
    end

    if self:has("restroomdoor") then
        table.insert(parts, "There is a single DOOR leading out of this room.")
    end

    if self:has("temple") then
        table.insert(parts, "The single DOOR out of this room leads to the TEMPLE.")
    end

    table.insert(parts, "Opposite of it, there is a TOILET. There's no other")
    table.insert(parts, "place for you to stand than right in front of it.")

    if self:has("trashcan") then
        table.insert(parts, "In the corner, there's a little plastic TRASHCAN.")
    end

    if self:has("trash") then
        table.insert(parts, "Inside, you saw some TRASH and a SHINY THING.")
    end

    if self:has("fire") then
        table.insert(parts, "There's a FIRE burning in the corner.")
    end

    if self:has("soot") then
        table.insert(parts, "In the corner, there's a pile of SOOT.")
    end

    return table.concat(parts, " ")
end


Data.Temple = class(Data.Room)

Data.Temple.THINGS = {"restroom", "cafeteria", "souvenierShop", "statue",
                      "painting", "_nailInWall", "flute", "altar", "yellowWeeds"}

function Data.Temple:look()
    local parts = {
        "You find yourself in what looks to be an ancient temple. The",
        "entire room is made from dark brick and the walls are lined with",
        "huge pillars that extend high up to the dome ceiling.",
        "\n\n",
    }

    if self:has("secretPassage") then
        table.insert(parts, "The stone ALTAR at the end of the room has slid")
        table.insert(parts, "aside and revealed a SECRET PASSAGE.")
    else
        table.insert(parts, "A stone ALTAR stands at the end of the room.")
    end

    table.insert(parts, "Next to it are a man-sized STATUE and a huge PAINTING.")
    table.insert(parts, "Doors lead to the CAFETERIA, RESTROOM and SOUVENIER SHOP.")

    return table.concat(parts, " ")
end


Data.Cafeteria = class(Data.Room)

Data.Cafeteria.THINGS = {"temple", "table", "chewingGum", "vendingMachine",
                         "_jerkyInMachine"}

function Data.Cafeteria:look()
    return table.concat({
        "You're bathing in the fluorescent lighting of a CAFETERIA.",
        "There's a VENDING MACHINE standing against the far wall",
        "and a cheap, round TABLE in the center of the room.",
        "This joint is pretty un-hip, you think to yourself, as you",
        "eye the exit back to the TEMPLE.",
    }, " ")
end


Data.SouvenierShop = class(Data.Room)

Data.SouvenierShop.THINGS = {"clapper", "slapChop", "bowflex", "temple"}

function Data.SouvenierShop:look()
    local parts = {
        "This is the SOUVENIER SHOP of the TEMPLE, filled with kitsch.",
    }

    if self:has("clapper") then
        table.insert(parts, "In the center of the room, there is a LAMP")
        table.insert(parts, "standing on a small pedestal.")
    end

    if self:has("sparks") then
        table.insert(parts, "SPARKS are happily flying from the")
        table.insert(parts, "filament of its exploded bulb.")
    end

    if self:has("slapChop") then
        table.insert(parts, "On the far wall, there's some plastic piece of")
        table.insert(parts, "junk that a sign identifies as a SLAP CHOP.")
    elseif self:has("_bladeInTable") then
        table.insert(parts, "On the far wall, there's a BLADE stuck in a table.")
    end

    table.insert(parts, "In one corner, a complex-looking piece of WORKOUT")
    table.insert(parts, "EQUIPMENT has been set up.")

    return table.concat(parts, " ")
end


Data.SecretPassage = class(Data.Room)

Data.SecretPassage.THINGS = {"temple", "exitDoor", "lever", "_holePipes"}

function Data.SecretPassage:look()
    local parts = {
        "You're at the foot of some stone stairs underneath the TEMPLE.",
        'In front of you is a DOOR with a glowing green "exit" sign above',
        "it. Next to it is a big old LEVER, connected to an intricate",
        "system of hydraulic PIPES that somehow seem to operate the DOOR.",
    }

    if self:has("_gumPipes") then
        table.insert(parts, "You stuck some CHEWING GUM around the rim of the")
        table.insert(parts, "hole in the PIPES.")
    elseif self:has("_nailPipes") then
        table.insert(parts, "You stuck your rusty NAIL into the hole in the PIPES.")
    elseif self:has("_fixedPipes") then
        table.insert(parts, "You made a makeshift patch for a hole in the PIPES")
        table.insert(parts, "from your rusty NAIL and some CHEWING GUM.")
    end

    return table.concat(parts, " ")
end


Data.BossRoom = class(Data.Room)

Data.BossRoom.THINGS = {"dragon", "dressShirt"}

function Data.BossRoom:look()
    local parts

    if self:has("dragon") then
        parts = {
            "You find yourself in a small room, which is mostly filled",
            "out by a large, fiersome DRAGON! It must be the root of all",
            "evil, the mastermind behind all of this. The air is hot and",
            "thick with smoke, filling you with anticipation and your",
            "lungs with carbon monoxide: you're ready for a fight!",
        }
    else
        parts = {
            "You're standing in the now-empty room and are clutching your",
            "spoils of combat in each hand: the GREETING CARD and the",
            "TWENTY DOLLARS that were inside it. On the ground lay the",
            "broken pair of GLASSES you knocked down. In front of you are",
            "STAIRS leading upwards to the surface, from where sunlight",
            "is streaming in.",
        }
    end

    return table.concat(parts, " ")
end


Data.stopwords = {
    ["a"] = true,
    ["at"] = true,
    ["and"] = true,
    ["down"] = true,
    ["in"] = true,
    ["into"] = true,
    ["of"] = true,
    ["off"] = true,
    ["on"] = true,
    ["onto"] = true,
    ["out"] = true,
    ["over"] = true,
    ["the"] = true,
    ["to"] = true,
    ["up"] = true,
    ["with"] = true,
}

Data.replacements = {
    shiney     = "shiny",
    dissicant  = "desiccant",
    dessiccant = "desiccant",
    desicant   = "desiccant",
    silicon    = "silica",
    silicone   = "silica",
}

Data.verbs = {
    ["act/applaud"] = "clap",
    ["act/appologize"] = "apologize",
    ["act/bawl"] = "cry",
    ["act/check"] = "look",
    ["act/examine"] = "look",
    ["act/exit"] = "die",
    ["act/give"] = "die",
    ["act/surrender"] = "die",
    ["act/masturbate"] = "fap",
    ["act/masterbate"] = "fap",
    ["act/jack"] = "fap",
    ["act/wank"] = "fap",
    ["act/grin"] = "laugh",
    ["act/ha"] = "laugh",
    ["act/hah"] = "laugh",
    ["act/haha"] = "laugh",
    ["act/halp"] = "help",
    ["act/hlp"] = "help",
    ["act/inspect"] = "look",
    ["act/investigate"] = "look",
    ["act/na"] = "no",
    ["act/nah"] = "no",
    ["act/naw"] = "no",
    ["act/nope"] = "no",
    ["act/quit"] = "die",
    ["act/see"] = "look",
    ["act/smile"] = "laugh",
    ["act/sorry"] = "apologize",
    ["act/sure"] = "yes",
    ["act/view"] = "look",
    ["act/watch"] = "look",
    ["act/whimper"] = "cry",
    ["act/whine"] = "cry",
    ["act/whinge"] = "cry",
    ["act/ye"] = "yes",
    ["act/yea"] = "yes",
    ["act/yeah"] = "yes",
    ["act/yup"] = "yes",
    ["interact/ascend"] = "climb",
    ["interact/bite"] = "eat",
    ["interact/boop"] = "poke",
    ["interact/check"] = "look",
    ["interact/clamber"] = "climb",
    ["interact/converse"] = "talk",
    ["interact/enter"] = "go",
    ["interact/examine"] = "look",
    ["interact/get"] = "take",
    ["interact/gobble"] = "eat",
    ["interact/goto"] = "go",
    ["interact/grab"] = "take",
    ["interact/gulp"] = "drink",
    ["interact/inspect"] = "look",
    ["interact/investigate"] = "look",
    ["interact/mount"] = "climb",
    ["interact/munch"] = "eat",
    ["interact/nibble"] = "eat",
    ["interact/pick"] = "take",
    ["interact/scale"] = "climb",
    ["interact/see"] = "look",
    ["interact/slurp"] = "drink",
    ["interact/sniff"] = "smell",
    ["interact/speak"] = "talk",
    ["interact/step"] = "stand",
    ["interact/stomp"] = "stand",
    ["interact/view"] = "look",
    ["interact/visit"] = "go",
    ["interact/walk"] = "go",
    ["interact/watch"] = "look",
}

Data.pre = {
    ["combine/blade/hands"] = function (adv)
        adv:combine("blade", "self")
        return true
    end,

    ["combine/fire/pants"] = function (adv)
        if adv.inv:has("shirt") or adv.inv:has("wetcloth") then
            return false
        end
        adv:print('After what happened to your SHIRT, you decide against just burning up your PANTS as well.')
        return true
    end,

    ["combine/fire/shirt"] = function (adv)
        if adv.inv:has("pants") or adv.inv:has("wetrag") then
            return false
        end
        adv:print('After what happened to your PANTS, you decide against just burning up your SHIRT as well.')
        return true
    end,

    ["combine/flute/yellowWeeds"] = function (adv)
        if not adv.inv:has("flute") then
            adv:interact("take", "flute")
            adv:print("")
        end
        if not adv.inv:has("yellowWeeds") then
            adv:interact("take", "weeds")
            adv:print("")
        end
        return false
    end,

    ["combine/greenFlute/wetWeeds"] = function (adv)
        adv:interact("take", "flute")
                        adv:print("")
                        adv:combine("flute", "weeds")
                        return true
    end,

    ["combine/greenFlute/yellowWeeds"] = function (adv)
        adv:interact("take", "flute")
                        adv:print("")
                        adv:combine("flute", "weeds")
                        return true
    end,

    ["combine/greenWeeds/litGreenFlute"] = function (adv)
        adv:interact("take", "flute")
                        adv:print("")
                        adv:combine("flute", "weeds")
                        return true
    end,

    ["combine/greenWeeds/litYellowFlute"] = function (adv)
        adv:interact("take", "flute")
                        adv:print("")
                        adv:combine("flute", "weeds")
                        return true
    end,

    ["combine/greenWeeds/wetFlute"] = function (adv)
        adv:interact("take", "flute")
                        adv:print("")
                        adv:combine("flute", "weeds")
                        return true
    end,

    ["combine/greenWeeds/yellowFlute"] = function (adv)
        adv:interact("take", "flute")
                        adv:print("")
                        adv:combine("flute", "weeds")
                        return true
    end,

    ["combine/litGreenFlute/wetWeeds"] = function (adv)
        adv:interact("take", "flute")
                        adv:print("")
                        adv:combine("flute", "weeds")
                        return true
    end,

    ["combine/litGreenFlute/yellowWeeds"] = function (adv)
        adv:interact("take", "flute")
                        adv:print("")
                        adv:combine("flute", "weeds")
                        return true
    end,

    ["combine/litYellowFlute/wetWeeds"] = function (adv)
        adv:interact("take", "flute")
                        adv:print("")
                        adv:combine("flute", "weeds")
                        return true
    end,

    ["combine/litYellowFlute/yellowWeeds"] = function (adv)
        adv:interact("take", "flute")
                        adv:print("")
                        adv:combine("flute", "weeds")
                        return true
    end,

    ["combine/wetFlute/yellowWeeds"] = function (adv)
        adv:interact("take", "flute")
                        adv:print("")
                        adv:combine("flute", "weeds")
                        return true
    end,

    ["combine/wetWeeds/yellowFlute"] = function (adv)
        adv:interact("take", "flute")
                        adv:print("")
                        adv:combine("flute", "weeds")
                        return true
    end,

    ["go/bossRoom"] = function (adv)
        if adv.room == adv.rooms["bossRoom"] then
                adv:print("You're already there.")
                return true
            end
            return false
    end,

    ["go/cafeteria"] = function (adv)
        if adv.room == adv.rooms["cafeteria"] then
                adv:print("You're already there.")
                return true
            end
            return false
    end,

    ["go/restroom"] = function (adv)
        if adv.room == adv.rooms["restroom"] then
                adv:print("You're already there.")
                return true
            end
            return false
    end,

    ["go/secretPassage"] = function (adv)
        if adv.room == adv.rooms["secretPassage"] then
                adv:print("You're already there.")
                return true
            end
            return false
    end,

    ["go/souvenierShop"] = function (adv)
        if adv.room == adv.rooms["souvenierShop"] then
                adv:print("You're already there.")
                return true
            end
            return false
    end,

    ["go/temple"] = function (adv)
        if adv.room == adv.rooms["temple"] then
                adv:print("You're already there.")
                return true
            end
            return false
    end,

    ["look/bossRoom"] = function (adv)
        if adv.room == adv.rooms["bossRoom"] then
                adv:act("look")
                return true
            end
            return false
    end,

    ["look/cafeteria"] = function (adv)
        if adv.room == adv.rooms["cafeteria"] then
                adv:act("look")
                return true
            end
            return false
    end,

    ["look/dressShirt"] = function (adv)
        if not adv.user.lookedAtShirt then
            adv.user.lookedAtShirt = true
            return false
        end
        adv:interact("look", "dragon")
        return true
    end,

    ["look/restroom"] = function (adv)
        if adv.room == adv.rooms["restroom"] then
                adv:act("look")
                return true
            end
            return false
    end,

    ["look/room"] = function (adv)
        adv:act("look")
        return true
    end,

    ["look/secretPassage"] = function (adv)
        if adv.room == adv.rooms["secretPassage"] then
                adv:act("look")
                return true
            end
            return false
    end,

    ["look/souvenierShop"] = function (adv)
        if adv.room == adv.rooms["souvenierShop"] then
                adv:act("look")
                return true
            end
            return false
    end,

    ["look/temple"] = function (adv)
        if adv.room == adv.rooms["temple"] then
                adv:act("look")
                return true
            end
            return false
    end,

    ["take/_nailInWall"] = function (adv)
        if not adv.scene.tripping then
            adv:print("You can't reach it, it's way too high up.")
            return true
        end
        return false
    end,

    ["take/altar"] = function (adv)
        if not adv.user.strong then
            adv:print('With all your might, you try to move the ALTAR. After minutes of pushing however, you have to come to terms with just being too weak.')
            return true
        end
        return false
    end,

    ["take/dragon"] = function (adv)
        if not adv.user.foughtDragon then
            adv:print("With what? Your bare hands?")
            adv.user.expectNextFight = true
            return true
        end
        return false
    end,

    ["talk/dragon"] = function (adv)
        if not adv.user.dragon then
            adv:print('That DRAGON looks way too fierce and scary to talk to!')
            return true
        elseif adv.user.dragon == 1 then
            adv:print('The DRAGON looks pretty fierce, you are scared to talk to it.')
            return true
        elseif adv.user.dragon == 2 then
            adv:print('The DRAGON still looks a little bit too fierce for conversation.')
            return true
        end
        return false
    end,

    ["use/hands"] = function (adv)
        adv:act("clap")
        return true
    end,
}

Data.amend = {
    ["combine/blade/greenWeeds"] = function (adv, msg)
        if not adv.user.weedSize then
                adv.user.weedSize = 1
            end
            adv.user.weedSize = adv.user.weedSize * 2
            return msg .. ' They\'re now 1/' .. adv.user.weedSize .. '-sized pieces.'
    end,

    ["combine/blade/wetWeeds"] = function (adv, msg)
        if not adv.user.weedSize then
                adv.user.weedSize = 1
            end
            adv.user.weedSize = adv.user.weedSize * 2
            return msg .. ' They\'re now 1/' .. adv.user.weedSize .. '-sized pieces.'
    end,

    ["combine/blade/yellowWeeds"] = function (adv, msg)
        if not adv.user.weedSize then
                adv.user.weedSize = 1
            end
            adv.user.weedSize = adv.user.weedSize * 2
            return msg .. ' They\'re now 1/' .. adv.user.weedSize .. '-sized pieces.'
    end,

    ["look/altar"] = function (adv, msg)
        if adv.room:has("secretPassage") then
            msg = msg .. ' You moved it out of the way to reveal a SECRET PASSAGE underneath.'
        else
            msg = msg .. ' The floor behind it is scratched up really badly, suggesting that this thing has been moved around at some point.'
        end

        if adv.room:has("yellowWeeds") then
            msg = msg .. ' Some WEEDS have sprouted up through the stone at the foot of the ALTAR long ago, but they\'re all dried up and yellow now.'
        end

        return msg
    end,

    ["look/clapper"] = function (adv, msg)
        if not adv.user.clapper then
            return msg .. ' It\'s turned off, and you don\'t see any switch or anything to turn it on.'
        elseif adv.user.clapper == 1 then
            return msg .. ' The bulb is glowing extraordinarily dimly.'
        elseif adv.user.clapper == 2 then
            return msg .. ' Even at its second intensity setting, the light is still very dim.'
        else
            return msg .. ' The lightbulb has exploded into 69,105 tiny pieces and SPARKS are happily flying from the filament.'
        end
    end,

    ["look/painting"] = function (adv, msg)
        if adv.room:has("_nailInWall") then
            return msg .. ' Way at the top of it you spot that it\'s held by a single, large NAIL.'
        else
            return msg .. ' Since you pulled out the NAIL, the PAINTING is just sitting on the ground, leaning against the wall.'
        end
    end,

    ["look/statue"] = function (adv, msg)
        if adv.room:has("flute") then
            return msg .. ' In its hands is a strange, bulbous FLUTE.'
        else
            return msg .. ' There\'s nothing in its hands anymore.'
        end
    end,

    ["look/table"] = function (adv, msg)
        if adv.room:has("chewingGum") then
            return msg .. ' and actually you\'re getting so bored of looking at this thing that even the CHEWING GUM underneath it seems to be a more interesting topic.'
        end
        return msg .. ' and actually you\'re getting incredibly bored of looking at this thing.'
    end,

    ["use/lever"] = function (adv, msg)
        if adv.room:has("_holePipes") then
            return msg .. ' However, instead of setting anything interesting in motion, the steam just escapes from the big hole in the PIPES. The LEVER returns to its original position, having accomplished nothing.'
        elseif adv.room:has("_gumPipes") then
            return msg .. ' Since your CHEWING GUM only covers the rim, the steam just escapes from the hole in the PIPES, preventing the mechanism from working properly. The LEVER resets itself to its original position.'
        elseif adv.room:has("_nailPipes") then
            return msg .. ' Since your NAIL doesn\'t sit air-tight, the steam just escapes from the hole in the PIPES, preventing the mechanism from working properly. The LEVER resets itself to its original position.'
        else
            return msg .. ' Your patch, literally made of rusted NAIL and CHEWING GUM, wobbles and strains precariously as the steam flows through the PIPES underneath it. Given your previous experiences with game objects spectacularly destroying themselves, you duck and cover.\n\nTo your surprise however, the patch holds and the DOOR slowly grinds open! You squeeze through it and it slams shut behind you.'
        end
    end,
}

Data.post = {
    ["combine/_gumPipes/nail"] = function (adv)
        adv.inv:remove("nail")
        adv.room:remove("_gumPipes")
        adv.room:add("_fixedPipes")
    end,

    ["combine/_holePipes/nail"] = function (adv)
        adv.inv:remove("nail")
        adv.room:remove("_holePipes")
        adv.room:add("_nailPipes")
    end,

    ["combine/_holePipes/plug"] = function (adv)
        adv.inv:remove("plug")
        adv.room:remove("_holePipes")
        adv.room:add("_fixedPipes")
    end,

    ["combine/_holePipes/softGum"] = function (adv)
        adv.inv:remove("softGum")
        adv.room:remove("_holePipes")
        adv.room:add("_gumPipes")
    end,

    ["combine/_nailPipes/softGum"] = function (adv)
        adv.inv:remove("softGum")
        adv.room:remove("_nailPipes")
        adv.room:add("_fixedPipes")
    end,

    ["combine/ash/vendingMachine"] = function (adv)
        adv.room:remove("vendingMachine")
        adv.room:remove("_jerkyInMachine")
        adv.inv:remove("ash")
        adv.room:add("_emptyMachine")
        adv.inv:add("jerky")
    end,

    ["combine/blade/chewingGum"] = function (adv)
        adv.room:remove("chewingGum")
        adv.inv:remove("blade")
        adv.inv:add("hardGum")
    end,

    ["combine/dragon/hands"] = function (adv)
        adv:fight_dragon()
    end,

    ["combine/fire/pants"] = function (adv)
        adv.inv:remove("pants")
    end,

    ["combine/fire/shirt"] = function (adv)
        adv.inv:remove("shirt")
    end,

    ["combine/fire/wetcloth"] = function (adv)
        adv.inv:remove("wetcloth")
        adv.room:remove("fire")
        adv.room:add("soot")
    end,

    ["combine/fire/wetrag"] = function (adv)
        adv.inv:remove("wetrag")
        adv.room:remove("fire")
        adv.room:add("soot")
    end,

    ["combine/flute/greenWeeds"] = function (adv)
        adv.inv:remove("flute")
        adv.inv:remove("greenWeeds")
        adv.inv:add("greenFlute")
    end,

    ["combine/flute/wetWeeds"] = function (adv)
        adv.inv:remove("flute")
        adv.inv:add("wetFlute")
    end,

    ["combine/flute/yellowWeeds"] = function (adv)
        adv.inv:remove("flute")
        adv.inv:add("yellowFlute")
    end,

    ["combine/greenFlute/sparks"] = function (adv)
        adv.inv:remove("greenFlute")
        adv.inv:add("litGreenFlute")
    end,

    ["combine/nail/softGum"] = function (adv)
        adv.inv:remove("nail")
        adv.inv:remove("softGum")
        adv.inv:add("plug")
    end,

    ["combine/pants/toilet"] = function (adv)
        adv.inv:remove("pants")
        adv.inv:add("wetrag")
    end,

    ["combine/restroomdoor/restroomkey"] = function (adv)
        adv.inv:remove("restroomkey")
        adv.room:remove("restroomdoor")
        adv.room:add("temple")
        adv.inv:add("temple")
        adv.inv:add("cafeteria")
        adv.inv:add("souvenierShop")
        adv:set_room("temple")
    end,

    ["combine/shirt/toilet"] = function (adv)
        adv.inv:remove("shirt")
        adv.inv:add("wetcloth")
    end,

    ["combine/silicaGelPacket/wetWeeds"] = function (adv)
        adv.inv:remove("silicaGelPacket")
        adv.inv:remove("wetWeeds")
        adv.inv:add("greenWeeds")
    end,

    ["combine/sparks/yellowFlute"] = function (adv)
        adv.inv:remove("yellowFlute")
        adv.inv:add("litYellowFlute")
    end,

    ["combine/toilet/yellowWeeds"] = function (adv)
        adv.inv:remove("yellowWeeds")
        adv.inv:add("wetWeeds")
    end,

    ["eat/hardGum"] = function (adv)
        adv.inv:remove("hardGum")
        adv.inv:add("softGum")
    end,

    ["go/bossRoom"] = function (adv)
        adv:set_room("bossRoom")
    end,

    ["go/cafeteria"] = function (adv)
        adv:set_room("cafeteria")
    end,

    ["go/restroom"] = function (adv)
        adv:set_room("restroom")
    end,

    ["go/secretPassage"] = function (adv)
        adv:set_room("secretPassage")
    end,

    ["go/souvenierShop"] = function (adv)
        adv:set_room("souvenierShop")
    end,

    ["go/stairs"] = function (adv)
        adv:wait()
        adv:game_over()
    end,

    ["go/temple"] = function (adv)
        adv:set_room("temple")
    end,

    ["look/dragon"] = function (adv)
        if not adv.user.dragon then
            adv.user.dragon = 0
        end
        if adv.user.dragon < 5 then
            adv.user.dragon = adv.user.dragon + 1
        end
    end,

    ["look/dressShirt/[1]"] = function (adv)

    end,

    ["look/trashcan/[1]"] = function (adv)
        adv.room:add("trash")
    end,

    ["take/_bladeInTable"] = function (adv)
        adv.room:remove("_bladeInTable")
        adv.inv:add("blade")
    end,

    ["take/_nailInWall"] = function (adv)
        adv.room:remove("_nailInWall")
        adv.inv:add("nail")
    end,

    ["take/altar/[1]"] = function (adv)
        adv.room:add("secretPassage")
        adv.inv:add("secretPassage")
    end,

    ["take/clothes"] = function (adv)
        adv.inv:remove("clothes")
        adv.inv:add("shirt")
        adv.inv:add("pants")
    end,

    ["take/dragon"] = function (adv)
        adv:fight_dragon()
    end,

    ["take/flute/[1]"] = function (adv)
        adv.room:remove("flute")
        adv.inv:add("flute")
    end,

    ["take/litYellowFlute"] = function (adv)
        adv.inv:remove("litYellowFlute")
        adv.inv:add("flute")
    end,

    ["take/shiny"] = function (adv)
        adv.room:remove("shiny")
        adv.room:remove("trash")
        adv.room:remove("trashcan")
        adv.room:add("fire")
    end,

    ["take/soot/[1]"] = function (adv)
        adv.inv:add("restroomkey")
        adv.inv:add("ash")

        local wipe = nil
        for i, t in ipairs {"pants", "shirt", "wetrag", "wetcloth"} do
            if adv.inv:has(t) then
                wipe = adv.inv:find(t)
                break
            end
        end

        adv:print("")

        if wipe then
            local gen = wipe == "pants" and "'" or "'s"
            adv.inv:remove(wipe)
            adv:print('You use your ' .. wipe.name .. ' to clean the ASH off of it, making it shiny again. You will always remember the ' .. wipe.name .. gen .. ' sacrifice.')
        else
            adv:print('You dust the ASH off of it, making it shiny again.')
        end
    end,

    ["take/wetFlute"] = function (adv)
        adv.inv:remove("wetFlute")
        adv.inv:add("flute")
    end,

    ["take/yellowFlute"] = function (adv)
        adv.inv:remove("yellowFlute")
        adv.inv:add("flute")
    end,

    ["take/yellowWeeds/[1]"] = function (adv)
        adv.room:remove("yellowWeeds")
        adv.inv:add("yellowWeeds")
    end,

    ["talk/dragon"] = function (adv)
        if not adv.user.dragonTalk then
            adv.user.dragonTalk = 0
        end
        if adv.user.dragonTalk == 2 then
            adv.user.expectNextFriends = true
        else
            adv.user.dragonTalk = adv.user.dragonTalk + 1
        end
    end,

    ["use/bowflex"] = function (adv)
        adv.user.strong = true
    end,

    ["use/jerky"] = function (adv)
        adv.inv:remove("jerky")
        adv.inv:add("silicaGelPacket")
    end,

    ["use/lever"] = function (adv)
        if adv.room:has("_fixedPipes") then
            adv.inv:remove("restroom")
            adv.inv:remove("temple")
            adv.inv:remove("cafeteria")
            adv.inv:remove("souvenierShop")
            adv.inv:remove("secretPassage")
            adv:set_room("bossRoom")
        end
    end,

    ["use/litGreenFlute"] = function (adv)
        adv.inv:remove("litGreenFlute")
        adv.inv:remove("greenWeeds")
            adv.scene.trip = true
            adv.scene:wait()
            adv:print("Whoah.")
    end,

    ["use/litYellowFlute"] = function (adv)
        adv.inv:remove("litYellowFlute")
        adv.inv:add("flute")
    end,

    ["use/slapChop"] = function (adv)
        adv.room:remove("slapChop")
        adv.room:add("_bladeInTable")
    end,
}

Data.messages = {
    ["onProfanity"] = {
        "Ew.",
        "Keep it family-friendly.",
        "That's some language you got on you.",
        "I'm not going to comment on that verbiage.",
        "Vulgar statement is insufficiently polite.",
    },

    ["befriendDragon1"] = {
        "FRED is very happy about that, he was starving. He invites you to ride on his back. He turns towards the exit and puts his tail in front of you to climb aboard.",
    },

    ["befriendDragon2"] = {
        "You get up on FRED's back and he flies out of the exit of the cave. You two soar high above the clouds under the afternoon sun, while FRED clutches the greeting card from his mom with the twenty dollars of lunch money inside. The people at the drive-through stare in awe at the large dragon coming through, humming a cheerful tune to himself, and even more at how many milk shakes he gets for you two.",
    },

    ["befriendDragon3"] = {
        "After lunch, FRED and you are way too full to go back and have a boss fight together. So you agree to just postpone that indefinitely and go home instead, to get some more comfortable (or in your case, any at all) clothes on. FRED thinks that milkshakes and a nap are a much nicer end to an adventure than beating someone up anyway, and you can't disagree with that.",
    },

    ["clapper1"] = {
        "And the LAMP's bulb begins to glow! Although don't get to excited, the glow is extremely dim, the filament is barely red.",
    },

    ["clapper2"] = {
        "The LAMP begins to glow ever so slightly more. It's still really dim though.",
    },

    ["clapper3"] = {
        "The LAMP starts to glow properly bright now. And it keeps getting brighter until the bulb suddenly explodes in a mist of broken glass! As you open your eyes again, you see that most of the bulb has disintegrated and the filament has been exposed, which is now spraying SPARKS everywhere.",
    },

    ["clapper4"] = {
        "The LAMP doesn't react to you anymore and SPARKS are still happily flying from it. The explosion probably broke the sensor.",
    },

    ["climb/dragon"] = {
        "Inside a small, confined room is not a good place to ride a DRAGON.",
    },

    ["climb/painting"] = {
        "There's nothing you could hold onto to do that.",
    },

    ["climb/table"] = {
        "It doesn't look like it would support your weight.",
    },

    ["combine/_emptyMachine"] = {
        "You'd rather not stick anything else in there, these things don't give change.",
    },

    ["combine/_fixedPipes"] = {
        "That won't help you fix the PIPES.",
    },

    ["combine/_fixedPipes/flute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_fixedPipes/greenFlute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_fixedPipes/greenWeeds"] = {
        "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
    },

    ["combine/_fixedPipes/hardGum"] = {
        "The CHEWING GUM is rock hard, it's useless as a patch.",
    },

    ["combine/_fixedPipes/litGreenFlute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_fixedPipes/litYellowFlute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_fixedPipes/wetFlute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_fixedPipes/wetWeeds"] = {
        "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
    },

    ["combine/_fixedPipes/yellowFlute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_fixedPipes/yellowWeeds"] = {
        "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
    },

    ["combine/_gumPipes"] = {
        "That won't help you fix the PIPES.",
    },

    ["combine/_gumPipes/flute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_gumPipes/greenFlute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_gumPipes/greenWeeds"] = {
        "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
    },

    ["combine/_gumPipes/hardGum"] = {
        "The CHEWING GUM is rock hard, it's useless as a patch.",
    },

    ["combine/_gumPipes/litGreenFlute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_gumPipes/litYellowFlute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_gumPipes/nail"] = {
        "You stick your rusty NAIL into the hole in the PIPES. It fits pretty well, and the CHEWING GUM makes an alright seal, if you completely disregard the safety of the large hydraulic mechanism.",
    },

    ["combine/_gumPipes/wetFlute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_gumPipes/wetWeeds"] = {
        "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
    },

    ["combine/_gumPipes/yellowFlute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_gumPipes/yellowWeeds"] = {
        "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
    },

    ["combine/_holePipes"] = {
        "That won't help you fix the PIPES.",
    },

    ["combine/_holePipes/flute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_holePipes/greenFlute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_holePipes/greenWeeds"] = {
        "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
    },

    ["combine/_holePipes/hardGum"] = {
        "The CHEWING GUM is rock hard, it's useless as a patch.",
    },

    ["combine/_holePipes/litGreenFlute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_holePipes/litYellowFlute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_holePipes/nail"] = {
        "You stick your rusty NAIL into the hole in the PIPES. It fits pretty well, but it doesn't seal it well. There's little gaps and cracks where the steam can still escape.",
    },

    ["combine/_holePipes/plug"] = {
        "You stick your makeshift PLUG into the hole in the PIPES. It seems to make an alright seal, if you completely disregard the safety of the large hydraulic mechanism.",
    },

    ["combine/_holePipes/softGum"] = {
        "You take your CHEWING GUM out of your mouth and try to cover the hole in the PIPES with it. However, you don't nearly have enough, so you basically just covered the rim with it.",
    },

    ["combine/_holePipes/wetFlute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_holePipes/wetWeeds"] = {
        "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
    },

    ["combine/_holePipes/yellowFlute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_holePipes/yellowWeeds"] = {
        "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
    },

    ["combine/_jerkyInMachine"] = {
        "You need to get it out of the VENDING MACHINE to do anything to it.",
    },

    ["combine/_nailInWall"] = {
        "That won't help you reach the NAIL.",
    },

    ["combine/_nailPipes"] = {
        "That won't help you fix the PIPES.",
    },

    ["combine/_nailPipes/flute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_nailPipes/greenFlute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_nailPipes/greenWeeds"] = {
        "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
    },

    ["combine/_nailPipes/hardGum"] = {
        "The CHEWING GUM is rock hard, it's useless as a patch.",
    },

    ["combine/_nailPipes/litGreenFlute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_nailPipes/litYellowFlute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_nailPipes/softGum"] = {
        "You take your CHEWING GUM out of your mouth and stick it around the edge of the rusty NAIL. It makes an alright seal around the hole in the PIPES, if you completely disregard the safety of the large hydraulic mechanism.",
    },

    ["combine/_nailPipes/wetFlute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_nailPipes/wetWeeds"] = {
        "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
    },

    ["combine/_nailPipes/yellowFlute"] = {
        "Trying to patch up a hole with a holey FLUTE will never work.",
    },

    ["combine/_nailPipes/yellowWeeds"] = {
        "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
    },

    ["combine/ash"] = {
        "Stop getting that ASH all over everything.",
    },

    ["combine/ash/vendingMachine"] = {
        "You scratch together a handful of ASH from all over your INVENTORY and pour it into the funnel. The machine rattles and a hollow voice from inside says \"weird how he's still ten after all these years, isn't it.\"\n\nIt then spits out the last bag of BEEF JERKY, which you take.",
    },

    ["combine/blade"] = {
        "The BLADE is way too dull to cut that.",
    },

    ["combine/blade/chewingGum"] = {
        "You painstakingly scrape off the CHEWING GUM from underneath the table. It takes you 45 minutes to do it, and you curse the culprit who stuck it under here. The BLADE has become even more incredibly dull, so you just throw it away angrily.",
    },

    ["combine/blade/greenWeeds"] = {
        "You cut the WEEDS into smaller pieces.",
    },

    ["combine/blade/hands"] = {
        "",
    },

    ["combine/blade/self"] = {
        "You feel a crawling in your skin and slash your wrists with the BLADE.\n\nOh wait no, it was just goosebumps. Good thing the BLADE is way too dull to cut through your skin.",
        "The BLADE is way too dull to even cut your skin.",
    },

    ["combine/blade/wetWeeds"] = {
        "You cut the WEEDS into smaller pieces.",
    },

    ["combine/blade/yellowWeeds"] = {
        "You cut the WEEDS into smaller pieces.",
    },

    ["combine/bowflex"] = {
        "That doesn't need a workout.",
    },

    ["combine/ceiling"] = {
        "You don't want to smash that into the CEILING.",
    },

    ["combine/chewingGum"] = {
        "You can't scrape off the CHEWING GUM with that. Maybe if you'd ever worked a real job in your life, you'd already know that.",
    },

    ["combine/clothes"] = {
        "Your CLOTHES are in use: you're wearing them.",
    },

    ["combine/dragon"] = {
        "That won't help you against the DRAGON.",
    },

    ["combine/dragon/hands"] = {
        "If you insist...",
        "You try to fight the DRAGON once more.",
    },

    ["combine/dragon/self"] = {
        "You offer YOURSELF as a sacrifice. The DRAGON asks you to please not make this weird.",
        "You've been asked to not make it weird, so stop doing that now.",
    },

    ["combine/exitDoor"] = {
        "You should just try pulling the LEVER instead of shoving that into the door.",
    },

    ["combine/fire/pants"] = {
        "You try to drape your PANTS over the FIRE to smother it out. It seems to work for a moment, but then they just catch on FIRE as well.",
    },

    ["combine/fire/shirt"] = {
        "You try to smother the flames with your SHIRT. However, the cheap fabric just catches FIRE immediately and only adds fuel to the flames.",
    },

    ["combine/fire/toilet"] = {
        "You can't just bring the FIRE and water from the TOILET together like that. The former is too hot to touch, and the latter just runs through your fingers.",
    },

    ["combine/fire/wetcloth"] = {
        "You throw your WET CLOTH over the fire to smother the flames. It smolders and hisses precariously - but in the end, the fire goes out!\n\nThere is just SOOT left where the TRASHCAN used to be.",
    },

    ["combine/fire/wetrag"] = {
        "You throw your WET RAG over the fire to smother the flames. It smolders and hisses precariously - but in the end, the fire goes out!\n\nThere is just SOOT left where the TRASHCAN used to be.",
    },

    ["combine/floor"] = {
        "You don't want to throw that on the FLOOR.",
    },

    ["combine/flute/greenWeeds"] = {
        "You stuff a bit of your dry, green WEEDS into the bottom of the FLUTE. It looks very appropriate.",
    },

    ["combine/flute/painting"] = {
        "You sensually rub your FLUTE against the PAINTING. It's weird, but nothing else.",
    },

    ["combine/flute/sparks"] = {
        "You stick the FLUTE into the SPARKS. It achieves absolutely nothing.",
    },

    ["combine/flute/statue"] = {
        "The FLUTE is of much more use to you than it is to this STATUE.",
    },

    ["combine/flute/toilet"] = {
        "Since you might still want to put your mouth on the FLUTE, you'd rather not stick it in the TOILET.",
    },

    ["combine/flute/wetWeeds"] = {
        "You stuff a bit of your wet, green WEEDS into the bottom of the FLUTE. It looks appropriate, but the wetness is just wrong.",
    },

    ["combine/flute/yellowWeeds"] = {
        "You stuff a bit of your dry, yellow WEEDS into the bottom of the FLUTE. It looks almost appropriate somehow.",
    },

    ["combine/greenFlute/greenWeeds"] = {
        "It's already full of that.",
    },

    ["combine/greenFlute/painting"] = {
        "You sensually rub your FLUTE against the PAINTING. It's weird, but nothing else.",
    },

    ["combine/greenFlute/sparks"] = {
        "You stick the FLUTE into the SPARKS. The WEEDS get lit up and start smoldering.",
    },

    ["combine/greenFlute/statue"] = {
        "The FLUTE is of much more use to you than it is to this STATUE.",
    },

    ["combine/greenFlute/toilet"] = {
        "Since you might still want to put your mouth on the FLUTE, you'd rather not stick it in the TOILET.",
    },

    ["combine/greenWeeds/sparks"] = {
        "You throw some of your dry, green WEEDS into the SPARKS. They catch on fire and fill the room with a chemical smell that makes you feel a bit dizzy.",
    },

    ["combine/greenWeeds/toilet"] = {
        "They've been in there enough.",
    },

    ["combine/hands"] = {
        "Get your grubby hands off of that.",
    },

    ["combine/hands/self"] = {
        "Stop touching yourself in front of me.",
    },

    ["combine/hands/vendingMachine"] = {
        "Your arms don't fit into the VENDING MACHINE. Just pay it like a normal person would.",
    },

    ["combine/hardGum"] = {
        "A hard wad of CHEWING GUM won't do any good there.",
    },

    ["combine/hardGum/toilet"] = {
        "But that CHEWING GUM still has so much flavor to it! You really don't want to put it in the toilet and ruin that experience forever.",
    },

    ["combine/litGreenFlute/painting"] = {
        "You sensually rub your FLUTE against the PAINTING. It's weird, but nothing else.",
    },

    ["combine/litGreenFlute/sparks"] = {
        "It's already lit.",
    },

    ["combine/litGreenFlute/statue"] = {
        "The FLUTE is of much more use to you than it is to this STATUE.",
    },

    ["combine/litGreenFlute/toilet"] = {
        "Since you might still want to put your mouth on the FLUTE, you'd rather not stick it in the TOILET.",
    },

    ["combine/litYellowFlute/painting"] = {
        "You sensually rub your FLUTE against the PAINTING. It's weird, but nothing else.",
    },

    ["combine/litYellowFlute/sparks"] = {
        "It's already lit.",
    },

    ["combine/litYellowFlute/statue"] = {
        "The FLUTE is of much more use to you than it is to this STATUE.",
    },

    ["combine/litYellowFlute/toilet"] = {
        "Since you might still want to put your mouth on the FLUTE, you'd rather not stick it in the TOILET.",
    },

    ["combine/nail"] = {
        "That doesn't need to be NAILed.",
    },

    ["combine/nail/softGum"] = {
        "You take the CHEWING GUM out of your mouth and wrap it around the rusty NAIL. The result is a makeshift PLUG, or at least you tell yourself that so that it doesn't seem weird why you're just sticking random objects together.",
    },

    ["combine/narrator"] = {
        "Stop using game objects on me, they leave stains.",
    },

    ["combine/painting"] = {
        "Don't ruin the nice PAINTING with that.",
    },

    ["combine/painting/wetFlute"] = {
        "You sensually rub your FLUTE against the PAINTING. It's weird, but nothing else.",
    },

    ["combine/painting/yellowFlute"] = {
        "You sensually rub your FLUTE against the PAINTING. It's weird, but nothing else.",
    },

    ["combine/pants"] = {
        "That doesn't want to wear any PANTS.",
    },

    ["combine/pants/self"] = {
        "You put your PANTS on your head. But that looks silly, so you take them back off again.",
    },

    ["combine/pants/shirt"] = {
        "Actually, now that you took them off, I guess it's alright to tell you: those two don't go together. Like, at all. I won't let you put them back on and have you embarrass yourself further.",
    },

    ["combine/pants/toilet"] = {
        "You soak your PANTS in the TOILET water. They're basically nothing more than a WET RAG now, with a blue tint.",
    },

    ["combine/plug"] = {
        "That doesn't need to be PLUGged.",
    },

    ["combine/restroomdoor/restroomkey"] = {
        "You put your KEY into the DOOR - it fits! You swing it aside and gleefully stride through.",
    },

    ["combine/self/shirt"] = {
        "You put your PANTS on your head. But that looks silly, so you take them back off again.",
    },

    ["combine/self/silicaGelPacket"] = {
        "You wipe your brow with the SILICA GEL PACKET. It does a good job at drawing away the sweat, leaving your forehead nice and dry.",
        "You're already dry enough. You'll have to find something else to draw the moisture out of.",
    },

    ["combine/self/vendingMachine"] = {
        "You don't fit into the VENDING MACHINE. Nor do any of your extremities.",
    },

    ["combine/shirt"] = {
        "Don't scatter your dirty laundry everywhere.",
    },

    ["combine/shirt/toilet"] = {
        "You dunk your SHIRT into the water in the bowl. It's really just a WET CLOTH now, tinted blue from the chemicals in the water.",
    },

    ["combine/silicaGelPacket"] = {
        "That doesn't need the moisture drawn out of it.",
    },

    ["combine/silicaGelPacket/toilet"] = {
        "It'd be pretty pointless to draw the water out of the TOILET, it would just refill with more water from the tank.",
    },

    ["combine/silicaGelPacket/wetFlute"] = {
        "The SILICA GEL PACKET doesn't fit into the hole of the flute. But you could just use it with the rest of your WEEDS instead.",
    },

    ["combine/silicaGelPacket/wetWeeds"] = {
        "You squish the SILICA GEL PACKET into your wad of wet WEEDS. It immediately sacrifices itself to soak up all the excess water from it. Now you have a stash of dry, green WEEDS, with all the chemicals and none of the wetness.",
    },

    ["combine/slapChop"] = {
        "You don't need to chop that. It probably wouldn't fit in the SLAP CHOP anyway.",
    },

    ["combine/softGum"] = {
        "You don't want to stick any CHEWING GUM on that.",
    },

    ["combine/sparks/wetFlute"] = {
        "You stick the FLUTE into the SPARKS, but the WEEDS inside it are so wet that it just causes fizzling noises.",
    },

    ["combine/sparks/wetWeeds"] = {
        "You throw some of your wet, green WEEDS into the SPARKS. Nothing much happens other than the SPARKS fizzling out as they touch the wet mass.",
    },

    ["combine/sparks/yellowFlute"] = {
        "You stick the FLUTE into the SPARKS. The WEEDS get lit up and start smoldering, creating smoke and the smell of burning leaves.",
    },

    ["combine/sparks/yellowWeeds"] = {
        "You throw some of your dry, yellow WEEDS into the SPARKS. They catch on fire and leave the unpleasant smell of burning leaves.",
    },

    ["combine/statue/wetFlute"] = {
        "The FLUTE is of much more use to you than it is to this STATUE.",
    },

    ["combine/statue/yellowFlute"] = {
        "The FLUTE is of much more use to you than it is to this STATUE.",
    },

    ["combine/table"] = {
        "You don't want to put anything on this TABLE, it looks like it hasn't been wiped down in the last century or so.",
    },

    ["combine/toilet/wetFlute"] = {
        "Since you might still want to put your mouth on the FLUTE, you'd rather not stick it in the TOILET.",
    },

    ["combine/toilet/wetWeeds"] = {
        "They've been in there enough.",
    },

    ["combine/toilet/wetcloth"] = {
        "That's already wet enough.",
    },

    ["combine/toilet/wetrag"] = {
        "It doesn't get any wetter than it is.",
    },

    ["combine/toilet/yellowFlute"] = {
        "Since you might still want to put your mouth on the FLUTE, you'd rather not stick it in the TOILET.",
    },

    ["combine/toilet/yellowWeeds"] = {
        "You dunk the yellow WEEDS into the blue, perfumy water of the TOILET. When you pull them out, the chemicals have turned them bright green. They're also very wet now.",
    },

    ["combine/vendingMachine"] = {
        "Trying to stick that into the VENDING MACHINE only yields you an annoying buzzing sound and the display reads \"INVALID CURRENCY\". Apparently it really does only take symbols of eternal youth.",
        "The VENDING MACHINE only takes symbols of eternal youth.",
    },

    ["combine/wall"] = {
        "You don't feel like decorating the WALL with that.",
    },

    ["combine/wetFlute/wetWeeds"] = {
        "It's already full of that.",
    },

    ["combine/wetcloth"] = {
        "That doesn't need to be wiped down.",
    },

    ["combine/wetrag"] = {
        "You don't need to clean that.",
    },

    ["combine/wetrag/wetrag"] = {
        "You wouldn't know what you'd use a wet clothrag for. Or a wet ragcloth, if you're left-handed.",
    },

    ["combine/yellowFlute/yellowWeeds"] = {
        "It's already full of that.",
    },

    ["combine/fire/hands"] = {
        "Your spell level is too low to wield FIRE magic.",
    },

    ["drink/narrator"] = {
        "I'm not liquid enough.",
    },

    ["drink/self"] = {
        "You're not liquid enough.",
    },

    ["drink/toilet"] = {
        "That deep blue water looks like it's about three-quarters cleaning agent, so it's probably not drinkable. Although you should probably not be drinking out of a TOILET anyway.",
    },

    ["eat/dragon"] = {
        "This DRAGON looks really chubby, eating it would make your cholesterol levels go through the roof!",
    },

    ["eat/flute"] = {
        "You chew on the FLUTE. It tastes like dust and clay.",
    },

    ["eat/greenFlute"] = {
        "You chew on the FLUTE. It tastes like dust and clay.",
    },

    ["eat/greenWeeds"] = {
        "You're pretty sure that's not how you get a kick out of WEEDS.",
    },

    ["eat/hardGum"] = {
        "You pop the hard wad of CHEWING GUM into your mouth. Surprisingly, it turns back to something chewy very quickly, and even still has a nice fruit punch flavor to it.",
    },

    ["eat/litGreenFlute"] = {
        "You chew on the FLUTE. It tastes like dust and clay.",
    },

    ["eat/litYellowFlute"] = {
        "You chew on the FLUTE. It tastes like dust and clay.",
    },

    ["eat/nail"] = {
        "Quit chewing your NAILs.",
    },

    ["eat/narrator"] = {
        "No, you need to watch your sodium intake.",
    },

    ["eat/pants"] = {
        "You think about eating your shorts, but you don't want to risk being sued for trademark violation.",
    },

    ["eat/plug"] = {
        "You're not sure when if your tetanus shots are still good, so you resist sticking the PLUG in your mouth.",
    },

    ["eat/self"] = {
        "Auto-cannibalism is not the answer.",
    },

    ["eat/silicaGelPacket"] = {
        "You better not! It would draw all the moisture from your body in an instant, leaving you as nothing but a dried-up pile of carbon.",
    },

    ["eat/softGum"] = {
        "You're already chewing it. Probably best to keep it in your mouth, since you wouldn't want it to stick up your inventory.",
    },

    ["eat/trash"] = {
        "It being a questionable food source aside, none of this TRASH is edible.",
    },

    ["eat/wetFlute"] = {
        "You chew on the FLUTE. It tastes like dust and clay.",
    },

    ["eat/wetWeeds"] = {
        "You're pretty sure that's not how you get a kick out of WEEDS.",
    },

    ["eat/yellowFlute"] = {
        "You chew on the FLUTE. It tastes like dust and clay.",
    },

    ["eat/yellowWeeds"] = {
        "You're pretty sure that's not how you get a kick out of WEEDS.",
    },

    ["fightDragon1"] = {
        "With a mighty leap, you jump up and grab the DRAGON's snout. It looks at you in surprise as you ball your hand into a fist and strike right between its eyes, leaving a nasty bruise and smashing its glasses. You handily land back on the ground, while the DRAGON reels and lands on its backside. It starts sobbing and begs you to not hurt it anymore. It can't see anything without its GLASSES, which lay broken on the floor.",
    },

    ["fightDragon2"] = {
        "Amazing, you vanquished the DRAGON with your bare hands! While it's still just sitting there, crying and shivering, you search through its belongings. Its wallet only contains reward cards from supermarkets and family restaurants, but the GREETING CARD in its shirt pocket has TWENTY DOLLARS in it! You take it and yell \"now be gone, fatso!\" With a miserable howl, the DRAGON rolls to its feet, wobbles up the STAIRS and runs into the wilderness.",
    },

    ["go/bossRoom"] = {
        "You somehow re-enter the BOSS ROOM.",
    },

    ["go/cafeteria"] = {
        "You visit the CAFETERIA.",
    },

    ["go/fire"] = {
        "You're already flaming enough.",
    },

    ["go/narrator"] = {
        "Maybe you can be the narrator in some other game, if you manage get out of this one.",
    },

    ["go/painting"] = {
        "You try to jump into the painting, expecting it to take you to stage 1. It doesn't work though, you just hit your head and fall to the floor.",
        "Your last interaction has disillusioned you enough already.",
    },

    ["go/restroom"] = {
        "Okay, you're back in the RESTROOM.",
    },

    ["go/restroomdoor"] = {
        "You grab the handle and walk forward, expecting the DOOR to yield to you. But it's locked, so you just awkwardly bump into it.",
        "The DOOR is still locked, you can't go through.",
    },

    ["go/room"] = {
        "You're already there.",
    },

    ["go/secretPassage"] = {
        "You make your way down the stairs of the SECRET PASSAGE.",
    },

    ["go/self"] = {
        "You close your eyes and go into yourself. You return to a calm and collected state. Then you wake up from your power nap.",
        "You go into yourself again, but you're not exhausted enough to have another nap.",
    },

    ["go/souvenierShop"] = {
        "You enter the unattended SOUVENIER SHOP.",
    },

    ["go/stairs"] = {
        "Having heroically vanquished the DRAGON like a true adventurer, you proudly stride out of the EXIT. Clutching the TWENTY DOLLARS of lunch money in your bare hands of terror, you make your way to the nearest store to buy some new clothes and a sandwich or something. The GREETING CARD lies forgotten on the floor, since the DRAGON is sure to lose its job and its mother's support after being defeated so easily.\n\nYou ascribe pit in your stomach to the feeling of accomplishment and glory.",
    },

    ["go/statue"] = {
        "You GO full BARD, dancing around and singing at the top of your lungs. But it gets exhausting quickly, so you stop doing that.",
        "No, you've realized that the BARD life isn't for you.",
    },

    ["go/temple"] = {
        "You return to the TEMPLE.",
    },

    ["go/trashcan"] = {
        "Aw, come on. You're not some kind of trash that sulks in a can all day. You're supposed to go out and dance in the streets, turning everyone's heads in awe, making them say: \"Wow, that's the most obnoxious piece of furry trash I've ever seen!\"",
    },

    ["help_commands"] = {
        "There are three types of commands:\n\nA single word, like LOOK or INVENTORY. This will just do something, like look around the room or tell you what you have in your inventory.\n\nA verb and a noun, like LOOK AT THING or OPEN DOOR. This will try to do the action to the thing, like telling you what the thing looks like or opening the door.\n\nA verb and two nouns, like COMBINE ICE WITH CREAM. This will try to put the two things together, like producing ice cream (which is totally logical).",
    },

    ["help_common"] = {
        "These are the most common commands. To save you some typing, you can abbreviate them with their first letter (like I instead of INVENTORY or U instead of USE).\n\n* INVENTORY\n\n* LOOK\n\n* LOOK/USE/TAKE/SPEAK (something)\n\n* GO (somewhere)\n\n* COMBINE (something) WITH (something else)",
    },

    ["help_game"] = {
        "This is a text adventure game. You type simple commands as to what you want to do any get responses from the computer.\n\nYou progress by figuring out the inventory object puzzles. This involves picking up stuff, combining it with other stuff and using your own deductive skills.\n\nYou can't die or make the game unwinnable (even though you'll no doubt try your hardest.)",
    },

    ["help_help"] = {
        "The HELP will try to HELP you if you give it a sensible topic.",
    },

    ["help_me"] = {
        "You're beyond HELP.",
    },

    ["help_tips"] = {
        "If you forget what's in a room, just type LOOK.\n\nPick up everything that isn't nailed down. And if it is nailed down, figure out a way to pull out the nails.\n\nYou can GO to rooms you've been to before directly, no need to traverse every room along the way.\n\nIf you're stuck, look at everything you have and read the descriptions attentively, they may give you a hint.\n\nThink outside the box and think literally - this game is made out of text after all.",
    },

    ["help_yourself"] = {
        "Thank you, how considerate.",
    },

    ["just_credits"] = {
        "Thanks to the testers: Cole, Hierro, Javeloz, miles57, Scaper, Smuggs, Soraime, Spike, Xelios.\n\nAdditional Puzzle Design by Smuggs.\n\n3D Models for the Secret Leopard Mode by miles57.\n\nWritten by askmeaboutloom.",
    },

    ["just_apologize"] = {
        "I forgive you.",
        "That's alright.",
        "No problem.",
        "Don't worry about it.",
        "What you've done is beyond apologies.",
    },

    ["just_breathe"] = {
        "You suddenly realize you haven't been breathing this entire time. You look down on yourself and it dawns on you: you've actually been a robot all along!\n\nOh wait, nevermind, you've just been breathing subconsciously.",
        "Actually, now that you think about it, you haven't actually been breathing this entire time! That can only mean one thing: you've been dead all along.\n\nOr alternatively, breathing is just not something you have to think about to be doing. That's more likely actually.",
        "You breathe in and suddenly see your vision flicker. You look at your hands and it happens again! Oh no, you know what that means - you're a hologram!\n\nHold on, actually, you were just blinking. Phew.",
    },

    ["just_blink"] = {
        "Your vision goes black. A split-second later, it returns.",
    },

    ["just_wink"] = {
        "You suddenly lose all vision on your left eye. Luckily, it's back to normal a moment later.",
        "You suddenly lose all vision on your right eye. Luckily, it's back to normal a moment later.",
    },

    ["just_ascend"] = {
        "ASCEND where?",
    },

    ["just_bite"] = {
        "BITE what?",
    },

    ["just_check"] = {
        "CHECK what?",
    },

    ["just_clamber"] = {
        "CLAMBER what?",
    },

    ["just_clap"] = {
        "You clap your hands.",
    },

    ["just_climb"] = {
        "CLIMB what?",
    },

    ["just_converse"] = {
        "CONVERSE with whom?",
    },

    ["just_cry"] = {
        "You curl into a ball on the floor and have a little time to yourself. You do feel a little better afterwards.",
        "You break out in tears at the unfairness of it all. It has no effect on the cruel world around you.",
        "You look over your shoulder, with a serious expression of desperation on your face. A single tear rolls down your cheek.",
        "You start sobbing uncontrollably. It takes several minutes before you calm down again, but you've regained some of your motivation.",
        "You lose your composure and start bawling your eyes out. You don't stop until your throat hurts and your voice is raspy. However, after having a little whinge, you feel more determined than ever.",
    },

    ["just_die"] = {
        "You cannot.",
        "Surrender is not an option.",
        "But you still have so much to live for!",
        "Aw come on, you're not that desperate yet.",
        R.platform == "emscripten"
            and "If you really want to quit, refresh the page."
            or "If you really want to quit, restart the application.",
    },

    ["just_drink"] = {
        "DRINK what?",
    },

    ["just_drop"] = {
        "Not right now.",
        "Quit being so lazy.",
        "You can do that later.",
        "You're not tired enough.",
        "You do that enough all day already.",
    },

    ["just_eat"] = {
        "EAT what?",
    },

    ["just_enter"] = {
        "ENTER where?",
    },

    ["just_examine"] = {
        "EXAMINE what?",
    },

    ["just_fap"] = {
        "Forget it, I'm not gonna narrate that.",
    },

    ["just_flex"] = {
        "You FLEX your muscles. It intimidates no one.",
    },

    ["just_get"] = {
        "GET what?",
    },

    ["just_go"] = {
        "GO where?",
    },

    ["just_gobble"] = {
        "GOBBLE what?",
    },

    ["just_goto"] = {
        "GOTO where?",
    },

    ["just_grab"] = {
        "GRAB what?",
    },

    ["just_gulp"] = {
        "GULP what?",
    },

    ["just_help"] = {
        "Type a topic you want help about:\n\n* HELP GAME\n\n* HELP COMMANDS\n\n* HELP COMMON\n\n* HELP TIPS",
    },

    ["just_inspect"] = {
        "INSPECT what?",
    },

    ["just_investigate"] = {
        "INVESTIGATE what?",
    },

    ["just_kill"] = {
        "You're too weak.",
        "Don't be so aggressive.",
        "You don't have the guts.",
        "Your strength is too low.",
        "You don't want to risk retaliation.",
        "No, you might hurt yourself doing that.",
        "Maybe you should look into your violent tendencies.",
    },

    ["just_laugh"] = {
        "Aren't you a happy cookie.",
    },

    ["just_kludgey"] = {
        "Good idea, but this actually isn't the right place for that. But props to getting that many points.",
    },

    ["just_typeglob"] = {
        "Nice try, but this isn't the place where you're supposed to use that.",
    },

    ["just_spiderbaby"] = {
        "Are you from the future? At the time this animation came out, that code hadn't been released yet.",
    },

    ["just_lay"] = {
        "Not right now.",
        "Quit being so lazy.",
        "You can do that later.",
        "You're not tired enough.",
        "You do that enough all day already.",
    },

    ["just_laze"] = {
        "Not right now.",
        "Quit being so lazy.",
        "You can do that later.",
        "You're not tired enough.",
        "You do that enough all day already.",
    },

    ["just_lie"] = {
        "Not right now.",
        "Quit being so lazy.",
        "You can do that later.",
        "You're not tired enough.",
        "You do that enough all day already.",
    },

    ["just_look"] = {
        "LOOK at what?",
    },

    ["just_mount"] = {
        "MOUNT what?",
    },

    ["just_munch"] = {
        "MUNCH what?",
    },

    ["just_nibble"] = {
        "NIBBLE what?",
    },

    ["just_no"] = {
        "Yes.",
        "Yup.",
        "Yeah.",
        "Mh-hm.",
        "Uh, yes.",
        "Positive.",
    },

    ["just_pick"] = {
        "PICK what?",
    },

    ["just_plugh"] = {
        "A hollow voice says \"nothing happens.\"",
    },

    ["just_rest"] = {
        "Not right now.",
        "Quit being so lazy.",
        "You can do that later.",
        "You're not tired enough.",
        "You do that enough all day already.",
    },

    ["just_scale"] = {
        "SCALE what?",
    },

    ["just_see"] = {
        "SEE what?",
    },

    ["just_sit"] = {
        "Not right now.",
        "Quit being so lazy.",
        "You can do that later.",
        "You're not tired enough.",
        "You do that enough all day already.",
    },

    ["just_sleep"] = {
        "Not right now.",
        "Quit being so lazy.",
        "You can do that later.",
        "You're not tired enough.",
        "You do that enough all day already.",
    },

    ["just_slurp"] = {
        "SLURP what?",
    },

    ["just_smell"] = {
        "SMELL what?",
    },

    ["just_sniff"] = {
        "SNIFF what?",
    },

    ["just_speak"] = {
        "SPEAK to whom?",
    },

    ["just_stand"] = {
        "STAND on what?",
    },

    ["just_step"] = {
        "STEP on what?",
    },

    ["just_stomp"] = {
        "STOMP on what?",
    },

    ["just_take"] = {
        "TAKE what?",
    },

    ["just_talk"] = {
        "TALK to whom?",
    },

    ["just_view"] = {
        "VIEW what?",
    },

    ["just_visit"] = {
        "VISIT what?",
    },

    ["just_walk"] = {
        "WALK where?",
    },

    ["just_watch"] = {
        "WATCH what?",
    },

    ["just_xyzzy"] = {
        "Nothing happens.",
    },

    ["just_yes"] = {
        "No.",
        "Nah.",
        "Nope.",
        "Nuh-uh.",
        "Um, no.",
        "Negatory.",
    },

    ["look/_bladeInTable"] = {
        "It's the only thing that's left of the SLAP CHOP after you slapped it: a dull BLADE stuck in the table.",
    },

    ["look/_emptyMachine"] = {
        "The VENDING MACHINE is empty now and the display just reads \"SOLD OUT\".",
    },

    ["look/_fixedPipes"] = {
        "It's an intricate hydraulic network connected to the DOOR. Once upon a time it was probably a pretty sweet mechanism, but now it's all rusted up. You made a makeshift patch for the hole in the PIPES from a rusty NAIL and some CHEWING GUM.",
    },

    ["look/_gumPipes"] = {
        "It's an intricate hydraulic network connected to the DOOR. Once upon a time it was probably a pretty sweet mechanism, but now it's all rusted up. You put some CHEWING GUM around the rim of the hole in the PIPES, but it doesn't come close to covering it.",
    },

    ["look/_holePipes"] = {
        "It's an intricate hydraulic network connected to the DOOR. Once upon a time it was probably a pretty sweet mechanism, but now it's all rusted up. There's even a hole in one of the PIPES, about as big around as your wrist.",
    },

    ["look/_jerkyInMachine"] = {
        "It's a lonely bag of original flavor BEEF JERKY. From the looks of it, it's the last of its kind. Who knows how long it's been in there.",
    },

    ["look/_nailInWall"] = {
        "It's a big old NAIL, about the size of your hand. It's stuck way high up on the wall and holding up the PAINTING.",
    },

    ["look/_nailPipes"] = {
        "It's an intricate hydraulic network connected to the DOOR. Once upon a time it was probably a pretty sweet mechanism, but now it's all rusted up. You stuck your rusty NAIL into the hole in the PIPES, but it's nowhere near airtight.",
    },

    ["look/altar"] = {
        "A smooth stone ALTAR is the center piece of this TEMPLE. It's queen size, but the surface is full of burn marks and doesn't look comfortable.",
    },

    ["look/ash"] = {
        "It's some ASH you somehow got in your INVENTORY when you picked up that shiny KEY of yours. And now it's just sticking over everything and you can't get rid of it all.",
    },

    ["look/blade"] = {
        "It's the BLADE out of the SLAP CHOP. It's very dull.",
    },

    ["look/bossRoom"] = {
        "If you want to take a look at that room, you should probably just GO there.",
    },

    ["look/bowflex"] = {
        "It's some overly complicated WORKOUT EQUIPMENT that's operated with a weird pulley system attached to some weights. The sign on it reads \"BOWFLEX revolution home workout equipment - now with 20% less long-term damages!\"",
    },

    ["look/brokenGlasses"] = {
        "It's the little pair of GLASSES that the DRAGON had on its nose. Your punch shattered and bent it up beyond repair.",
        "You know, the DRAGON is now wandering through the wilderness all alone, without being able to see anything. Oh, but I'm sure you did what you had to do, self defense and all that.",
        "How about next time you blow up a light bulb I don't warn you and you can't see anything anymore. How would that feel?",
        "Umm, I mean, it's just a pair of GLASSES that were broken when you... heroically vanquished the DRAGON.\n\nPlease don't hurt me.",
        "Broken GLASSES, a testament of your... heroic deeds.",
    },

    ["look/cafeteria"] = {
        "If you want to take a look at that room, you should probably just GO there.",
    },

    ["look/ceiling"] = {
        "It's a fascinating CEILING.",
    },

    ["look/chewingGum"] = {
        "It's a pink wad of dry CHEWING GUM, firmly stuck to the underside of the TABLE.",
    },

    ["look/clapper"] = {
        "It's some kind of desk lamp sitting on a podium, but it's just a bare stick, without any lampshade. A sign on the podium reads \"The Clapper - With Three Intensity Settings\".",
    },

    ["look/clothes"] = {
        "Well, they're your CLOTHES. Nothing fancy. Not implying that you don't know how to dress properly, it just didn't fit the occasion. No one would expect you to wear something other than rags to a text adventure game.",
    },

    ["look/dragon"] = {
        "It's a fiersome DRAGON! Its long, spiked tail twitches restlessly, its man-sized claws scrape the ground underneath and smoke is rising from its flaring nostrils. Which is fogging up the little, square glasses sitting on its nose.",
        "The large DRAGON stares back at you, looking determined and fearless. Its fingers are fiddling with his badly-tied tie, while his other hand firmly grips a greeting card in its DRESS SHIRT pocket for reassurance.",
        "It's getting kinda awkward to have you stare at the DRAGON so much. It shakily opens his mouth to say something, but then chokes on its own smoke and enters a coughing fit.",
        "The DRAGON has recovered from its coughing and is looking embarrassed. Its breath has gotten quick and it seems to be sweating nervously. The situation is getting dangerously uncomfortable.",
        "The poor little DRAGON just looks around the room, evading your stare.",
    },

    ["look/dressShirt"] = {
        "The DRAGON is wearing a DRESS SHIRT that seems to be a bit too small for its chubby stature. Around its neck hangs a tie that looks like it's been tied by someone who'd never done it before. In the shirt pocket you can spot a greeting card depicting a cartoon bunny rabbit wishing the greetee all the best for a new job.",
    },

    ["look/exitDoor"] = {
        "It's a large, wooden DOOR with a glowing \"exit\" sign above it. It doesn't have a handle though, instead it seems to be operated by that LEVER next to it.",
    },

    ["look/fire"] = {
        "All you see is FIRE. But in the back of your mind, the SHINY THING inside it is still calling for your taking.",
    },

    ["look/floor"] = {
        "Well, it sure is a FLOOR. And you're standing on it.",
    },

    ["look/flute"] = {
        "It's an odd-looking, curved FLUTE with a bulbous end. It doesn't actually look like it'd make for good music, since there's no holes other than the one you blow into and the one air comes out.",
    },

    ["look/greenFlute"] = {
        "It's an odd-looking, curved FLUTE with a bulbous end. It doesn't actually look like it'd make for good music, since there's no holes other than the one you blow into and the one air comes out. You stuffed some dry, green WEEDS into it",
    },

    ["look/greenWeeds"] = {
        "It's a stash of dry, green WEEDS. You should probably get rid of it before you get arrested.",
    },

    ["look/greetingCard"] = {
        "It's the GREETING CARD you took from the DRAGON as your spoils. It's got a cartoon bunny rabbit on the front wishing the reader all the best for a new job. On the inside, a hand-written message, encircled with a heart shape, reads \"I'm so glad you finally got a job! I'm sure you'll do just fine keeping all those adventurers out. Love, mom.\"",
    },

    ["look/hands"] = {
        "They're your BARE HANDS, soft and gentle.",
    },

    ["look/hardGum"] = {
        "It's old, it's hard, it's CHEWING GUM.",
    },

    ["look/jerky"] = {
        "It's a packet of original flavor BEEF JERKY. Who knows how long it had been in that machine.",
    },

    ["look/lever"] = {
        "It's a big LEVER connected to the mechanism of PIPES that operate the DOOR.",
    },

    ["look/litGreenFlute"] = {
        "It's an odd-looking, curved FLUTE with a bulbous end. It doesn't actually look like it'd make for good music, since there's no holes other than the one you blow into and the one air comes out. The green WEEDS inside are smoldering and smoking. The chemical smell is making you feel light-headed.",
    },

    ["look/litYellowFlute"] = {
        "It's an odd-looking, curved FLUTE with a bulbous end. It doesn't actually look like it'd make for good music, since there's no holes other than the one you blow into and the one air comes out. The yellow WEEDS inside it are smoldering and smoking. The burning smell is making your head hurt.",
    },

    ["look/nail"] = {
        "It's a large rusty NAIL, about the size of your hand.",
    },

    ["look/narrator"] = {
        "You don't see me, you can only hear my voice in your head.",
    },

    ["look/painting"] = {
        "This is a 20 ft tall PAINTING depicting a handful of people sitting around a campfire, puffing smoke from their pipes.",
    },

    ["look/pants"] = {
        "Well, PANTS might be stretching it. They're a pair of shorts. Basically a rag with two leg holes in it.",
    },

    ["look/plug"] = {
        "It's the best (and only) PLUG you've ever made. But it's actually just a rusty NAIL with some CHEWING GUM wrapped around it.",
    },

    ["look/restroom"] = {
        "If you want to take a look at that room, you should probably just GO there.",
    },

    ["look/restroomdoor"] = {
        "It's a sturdy wooden DOOR. It's got like a frame and a handle and such, as you would expect.",
    },

    ["look/restroomkey"] = {
        "You and this small, shiny KEY have had quite the adventure together. You went through fire and flames for each other.\n\nWell, at least one of you did, the other just got naked and dunked things in a TOILET for a while.",
    },

    ["look/room"] = {
        "It's a room.",
    },

    ["look/secretPassage"] = {
        "If you want to take a look at that room, you should probably just GO there.",
    },

    ["look/shiny"] = {
        "Well, it's a small SHINY THING. It sits at the bottom of the TRASHCAN, amongst the still smoldering ashes of cigarette butts. You can't deny the primal instincts within you making you want to TAKE this SHINY THING with you.",
        "The SHINY THING's shininess is beckoning you to TAKE it. You might get your hands dirty but it'll totally be worth it.",
    },

    ["look/shirt"] = {
        "It's one of those SHIRTs you get in a multi pack from the supermarket. The thin, gray, stringy fabric makes it look like some kind of cloth rather than something wearable.",
    },

    ["look/silicaGelPacket"] = {
        "It's a SILICA GEL PACKET. One of those inedible little plastic squares that keep the moisture out of food. If you like big words with strange double letters, you may also call it a desiccant.",
    },

    ["look/slapChop"] = {
        "It's a small, cylindrical plastic contraption with a button on top that reads \"slap me\". A sign above it describes it as \"The SLAP CHOP - Slap Your Food Cutting Troubles Away\".",
    },

    ["look/softGum"] = {
        "You take it out of your mouth to take a look at the CHEWING GUM. It's soft, chewy and pink. You put it back into your mouth.",
        "You don't need another look at it, it's just CHEWING GUM.",
    },

    ["look/soot"] = {
        "It's a bunch of SOOT left over from the TRASHCAN you lit on fire.",
    },

    ["look/souvenierShop"] = {
        "If you want to take a look at that room, you should probably just GO there.",
    },

    ["look/sparks"] = {
        "There's SPARKS happily spraying from the exposed filament of the ex-lightbulb. They're leaving scorch marks over the podium and floor.",
    },

    ["look/stairs"] = {
        "It's the STAIRS leading out of this place, sunlight is streaming in. You hear scraps of sobbing and crying still wafting in from the outside every now and then.",
    },

    ["look/statue"] = {
        "It's a life-sized STATUE made from dark marble. It depicts some kind of bard with frilly clothing a rather dopey expression.",
    },

    ["look/table"] = {
        "It's a cheap, round TABLE made of plastic. The surface has one of those gray patterns that makes it look perpetually dirty, the construction of the legs is less than stellar,",
    },

    ["look/temple"] = {
        "If you want to take a look at that room, you should probably just GO there.",
    },

    ["look/toilet"] = {
        "Well, it's a TOILET. It's giving this room its restroom-like feel. The porcelain is sparkling clean and the water in the bowl is bright blue, giving off a perfumy scent. You feel a little light-headed from the chemicals.",
    },

    ["look/trash"] = {
        "It's just TRASH. Wads of paper and such.",
        "Just TRASH. Like bits of cardboard.",
        "There's also some wood shavings in this TRASH.",
        "Nothing but TRASH. Paper towels for instance.",
        "Some cans of hair spray are in this TRASH too.",
        "Really, just TRASH here. Tinder for example.",
        "Someone dumped their fireworks in this TRASH.",
        "Boxes of matches also fester amongst the TRASH.",
        "Still just TRASH. Gunpowder is stuck all over it.",
        "Only TRASH. Like half-empty kerosine bottles.",
        ".rand",
    },

    ["look/trashcan"] = {
        "You peer into the TRASHCAN. It contains a bunch of TRASH in its natural habitat. However, amongst the cigarette butts at the bottom, a SHINY THING is glistening at you.",
        "There's TRASH in there, but also a SHINY THING buried in the cigarette butts at the bottom.",
    },

    ["look/twentyDollars"] = {
        "It's TWENTY DOLLARS you took out of the DRAGON's GREETING CARD as your spoils of combat. Which is totally okay, you did vanquish it after all.",
        "No, it's fine, you took those TWENTY DOLLARS fair and square. It's not like the DRAGON's mother gave that to him as a present or anything.",
        "You know, maybe we should call this item \"blood money\" instead.",
        "Alright, alright! It's just a bill of TWENTY DOLLARS, please don't beat me up as well.",
        "It's... just a regular TWENTY DOLLARS.",
    },

    ["look/vendingMachine"] = {
        "It's one of those weird cult edition VENDING MACHINEs. Instead of a coin slot, there is a funnel and the display above it reads \"INSERT SYMBOL OF ETERNAL YOUTH\". Inside of the machine, there is a single, lonely bag of original flavor BEEF JERKY.",
    },

    ["look/wall"] = {
        "The WALL is exceedingly vertical.",
    },

    ["look/wetFlute"] = {
        "It's an odd-looking, curved FLUTE with a bulbous end. It doesn't actually look like it'd make for good music, since there's no holes other than the one you blow into and the one air comes out. You stuffed some wet, green WEEDS into it",
    },

    ["look/wetWeeds"] = {
        "It's a wad of wet, green WEEDS. It smells strongly of chemicals, it almost makes your head spin.",
    },

    ["look/wetcloth"] = {
        "This used to be your SHIRT, but now it's a WET CLOTH. It looks pretty neat now though, the chemicals in the water made it all blue.",
    },

    ["look/wetrag"] = {
        "It's your former PANTS, now a WET RAG. Aside from being much more fashionable, it's got a fancy blue color now.",
    },

    ["look/yellowFlute"] = {
        "It's an odd-looking, curved FLUTE with a bulbous end. It doesn't actually look like it'd make for good music, since there's no holes other than the one you blow into and the one air comes out. You stuffed a bunch of dried, yellow WEEDS into it.",
    },

    ["look/yellowWeeds"] = {
        "It's a bunch of dry, yellow WEEDS. Whatever green they had has withered long ago and now they're just yellow.",
    },

    ["no_apologize"] = {
        "It doesn't seem to care for your apologies.",
    },

    ["no_cast"] = {
        "You don't have enough mana.",
    },

    ["no_climb"] = {
        "Your climbing skill is too low.",
        "It's not a climbable surface.",
    },

    ["no_combine"] = {
        "They don't go together.",
        "Don't know how to put those two together",
    },

    ["no_drink"] = {
        "It's not potable.",
        "That's undrinkable.",
        "You can't get drunk off of that.",
    },

    ["no_drop"] = {
        "You're nowhere near your carrying limit.",
        "Not right now.",
        "Quit being so lazy.",
        "You can do that later.",
        "You're not tired enough.",
        "You do that enough all day already.",
    },

    ["no_eat"] = {
        "It's inedible.",
        "You couldn't stomach that.",
        "That's not something you can eat.",
    },

    ["no_insult"] = {
        "You call it dumb.",
        "You call it ugly.",
        "You call it silly.",
        "You call it a bum.",
        "You call it smelly.",
        "You call it boring.",
        "You call it a bigot.",
        "You call it ignorant.",
        "You call it offensive.",
        "You call it a dumb thing.",
        "You call it a waste of space.",
        "You call it the worst game object you've ever seen.",
    },

    ["no_interpret"] = {
        "Eh?",
        "What? Maybe try typing \"HELP\".",
        "I don't understand you at all.",
        "Does not compute. Please rephrase.",
        "I can't even begin to make sense of that sentence.",
    },

    ["no_lay"] = {
        "Not right now.",
        "Quit being so lazy.",
        "You can do that later.",
        "You're not tired enough.",
        "You do that enough all day already.",
    },

    ["no_laze"] = {
        "Not right now.",
        "Quit being so lazy.",
        "You can do that later.",
        "You're not tired enough.",
        "You do that enough all day already.",
    },

    ["no_lick"] = {
        "It's unlickable.",
        "Stop that, it's rude.",
        "No, there's germs on it.",
        "You're not putting your lips on that.",
        "Quit it, we can get you a lollipop later if you really need to lick something.",
    },

    ["no_lie"] = {
        "Not right now.",
        "Quit being so lazy.",
        "You can do that later.",
        "You're not tired enough.",
        "You do that enough all day already.",
    },

    ["no_look"] = {
        "You don't see anything because the programmer forgot to give this thing a description. Sorry.",
    },

    ["no_poke"] = {
        "It misses.",
        "It failed.",
        "You're out of poke points.",
        "You try to poke it, but it resists.",
        "It's defense is too high for your poke.",
        "You poke, but miss so badly that you just hit your own nose instead.",
    },

    ["no_reach"] = {
        "And what would you do if you reached it?",
    },

    ["no_rest"] = {
        "Not right now.",
        "Quit being so lazy.",
        "You can do that later.",
        "You're not tired enough.",
        "You do that enough all day already.",
    },

    ["no_sit"] = {
        "Not right now.",
        "Quit being so lazy.",
        "You can do that later.",
        "You're not tired enough.",
        "You do that enough all day already.",
    },

    ["no_sleep"] = {
        "Not right now.",
        "Quit being so lazy.",
        "You can do that later.",
        "You're not tired enough.",
        "You do that enough all day already.",
    },

    ["no_smell"] = {
        "There's no smell to speak of.",
        "It's got a very generic smell.",
        "It smells of absolutely nothing.",
    },

    ["no_stand"] = {
        "Don't put your feet all over that.",
        "It doesn't look like it could support your weight.",
    },

    ["no_take"] = {
        "You don't really want it.",
        "You can't take that with you.",
        "You'd rather not carry that around with you.",
    },

    ["no_talk"] = {
        "You get no response.",
        "It's not very talkative.",
    },

    ["no_touch"] = {
        "It's untouchable.",
        "Just touching it won't get you anywhere.",
        "You think about rubbing your hands all over it, but then realize that that's both weird and useless.",
    },

    ["no_use"] = {
        "It's utterly useless.",
        "You have no use for it.",
        "That's just not useful.",
    },

    ["smell/chewingGum"] = {
        "Mmh, fruit punch!",
    },

    ["smell/dragon"] = {
        "It smells of smoke and a little bit too much aftershave.",
    },

    ["smell/flute"] = {
        "It smells like herbs and smoke.",
    },

    ["smell/greenFlute"] = {
        "It smells like herbs and smoke.",
    },

    ["smell/hardGum"] = {
        "Mmh, fruit punch!",
    },

    ["smell/jerky"] = {
        "It's a sealed plastic bag, so you don't SMELL anything.",
    },

    ["smell/litGreenFlute"] = {
        "It smells like herbs and smoke.",
    },

    ["smell/litYellowFlute"] = {
        "It smells like herbs and smoke.",
    },

    ["smell/nail"] = {
        "Notes of rust and drywall.",
    },

    ["smell/narrator"] = {
        "I smell omnicient.",
    },

    ["smell/painting"] = {
        "It smells unpleasantly like dry paint and smoke. Probably because it's meant to be LOOKed at, not smelled.",
    },

    ["smell/plug"] = {
        "It smells great actually, the fruit punch melds really well with the notes of rust and drywall.",
    },

    ["smell/self"] = {
        "You smell like yourself. I won't elaborate on that.",
    },

    ["smell/silicaGelPacket"] = {
        "Mmh, a hint of processed meat, smoke flavoring and salt.",
    },

    ["smell/softGum"] = {
        "You can taste it, it's fruit punch flavor. It probably smells of that too.",
    },

    ["smell/sparks"] = {
        "It smells like an electrical fire.",
    },

    ["smell/table"] = {
        "Ew, it smells like a decade's worth of drinks spilled in unison and never cleaned up.",
    },

    ["smell/toilet"] = {
        "It smells very, very clean. Like someone used a massively corrosive substance to ensure no living thing would get near this TOILET. In fact, you're getting quite the headache from smelling it, so you decide to stop doing that.",
        "To avoid permanent brain damage, you'd rather not SMELL that stuff again. Those chemicals really pack a punch.",
    },

    ["smell/trash"] = {
        "Ew, smells like this TRASH is soaked in gasoline.",
    },

    ["smell/trashcan"] = {
        "It smells like gasoline. Which is kinda odd for a restroom trashcan, but why are you smelling it anyway.",
    },

    ["smell/wetFlute"] = {
        "It smells like herbs and smoke.",
    },

    ["smell/yellowFlute"] = {
        "It smells like herbs and smoke.",
    },

    ["stand/ceiling"] = {
        "Your current gravity situation does not allow for it.",
    },

    ["stand/fire"] = {
        "Since you're barefoot, stepping on the FIRE is a really bad idea.",
    },

    ["stand/floor"] = {
        "You're standing on it already.",
    },

    ["stand/self"] = {
        "You stand on your own foot. It hurts.",
    },

    ["stand/toilet"] = {
        "You don't want to get your feet wet, you'll catch a cold.",
    },

    ["stand/wall"] = {
        "The WALL's verticality prevents you from doing that.",
    },

    ["take/_bladeInTable"] = {
        "You pull the BLADE out of the table. It's so dull that you don't have to worry about it damaging anything else in your INVENTORY.",
    },

    ["take/_fixedPipes"] = {
        "No, it's good where it's at.",
    },

    ["take/_gumPipes"] = {
        "No, it's good where it's at.",
    },

    ["take/_holePipes"] = {
        "No, it's good where it's at.",
    },

    ["take/_jerkyInMachine"] = {
        "You need to pay the VENDING MACHINE to get the BEEF JERKY.",
    },

    ["take/_nailInWall"] = {
        "You pull the NAIL out of the wall with relative ease. The PAINTING falls to the ground with a thump.",
    },

    ["take/_nailPipes"] = {
        "No, it's good where it's at.",
    },

    ["take/altar"] = {
        "With your new-found strength, you stem yourself against the ALTAR. Inch by inch, you manage to push it back far enough to reveal a SECRET PASSAGE! You let out a scream of victory, hoping that you can convince yourself that this was worth all the pain and suffering.",
        "You put enough effort into moving it once already.",
    },

    ["take/blade"] = {
        "You wield the BLADE (1d4 nonlethal bludgeoning damage).",
        "It's already equipped.",
    },

    ["take/bowflex"] = {
        "Nah, you'd probably use it once or twice and then it would sit in the corner gathering dust. Just like your other workout equipment.",
    },

    ["take/brokenGlasses"] = {
        "You don't want these GLASSES, they're way uncool and also broken.",
    },

    ["take/chewingGum"] = {
        "You desparately scratch at the CHEWING GUM with your fingernails, but it's too firmly stuck to the surface to pull it of that way.",
        "You still can't pull it off with your bare hands.",
    },

    ["take/clapper"] = {
        "It's firmly affixed to its podium, and even the bulb is glued in place.",
    },

    ["take/clothes"] = {
        "Alright then. You take off your SHIRT and PANTS. Exposed to the raw elements, your underwear immediately disintegrates into a fine mist, leaving you naked.",
    },

    ["take/dragon"] = {
        "You try to fight the DRAGON once more.",
    },

    ["take/dressShirt"] = {
        "It's way too big for you. Besides, you'd probably just ruin it like you did your own clothes.",
    },

    ["take/fire"] = {
        "You reach into the FIRE and burn your fingers. They hurt now and you feel a little sad.",
        "You remember what happened last time you tried to put your hands into the FIRE. The feeling of a little sadness washes over you and you decide not to do it again.",
    },

    ["take/flute"] = {
        "You grab the FLUTE the STATUE is holding and yank it out. It's surprisingly easy, as if it's meant to be detachable.",
        ".got",
    },

    ["take/greenFlute"] = {
        "No, this looks very right to you. The WEEDS stay in the FLUTE.",
    },

    ["take/greenWeeds"] = {
        "You can't just TAKE WEEDS like that.",
    },

    ["take/hands"] = {
        "You wield your BARE HANDS (1 nonlethal poking damage, -2 confidence bonus to all attack and damage rolls).",
    },

    ["take/litGreenFlute"] = {
        "No, this looks very right to you. The WEEDS stay in the FLUTE.",
    },

    ["take/litYellowFlute"] = {
        "You decide to take the WEEDS back out of the FLUTE.",
    },

    ["take/nail"] = {
        ".got",
    },

    ["take/narrator"] = {
        "You can't reach me.",
    },

    ["take/painting"] = {
        "This thing is way too heavy to drag around with you.",
    },

    ["take/pants"] = {
        "You won't achieve anything by taking off your pants just to put them back on later. Just look where it got you in real life.",
    },

    ["take/restroomkey"] = {
        "After what you went through, you'll take this KEY to the end of the world! Or at least until you USE it on something and it disappears from your INVENTORY.",
    },

    ["take/self"] = {
        "No one can take you away from me.",
    },

    ["take/shiny"] = {
        "You reach into the TRASHCAN and grab the SHINY THING at the bottom - it feels smooth and metal, just like a SHINY THING should. However, as you pull it up, a spark releases from the cigarette butts around it. It ignites the TRASH and the whole TRASHCAN bursts into flames!\n\nYou're fine, but needless to say, you didn't get the SHINY THING. You only started a FIRE.",
    },

    ["take/shirt"] = {
        "You already took it off. And you're not gonna get to put it back on, you stay naked and think about the consequences of your actions.",
    },

    ["take/slapChop"] = {
        "It's glued to the table. But actually, you don't want to chop small amounts of food via domestic violence anyway.",
    },

    ["take/soot"] = {
        "You rummage around in the SOOT, looking for that elusive SHINY THING you saw before. Eventually, your fingers grasp the metal thing and you triumphantly pull it towards you: It's a small metal KEY!",
        "You already found the KEY, no need to get your hands any dirtier than they are.",
    },

    ["take/statue"] = {
        "If this STATUE were alive, you might TAKE it with you. But until you learn that animate object spell, that's not gonna happen.",
    },

    ["take/table"] = {
        "This TABLE isn't hip enough to be part of your collection of furniture.",
    },

    ["take/toilet"] = {
        "It's firmly anchored to the wall. You rationalize your failure by arguing that you would look pretty silly carrying a TOILET around with you.",
    },

    ["take/trash"] = {
        "While this is an adventure game, you don't need to carry literal TRASH around with you.",
    },

    ["take/trashcan"] = {
        "Your INVENTORY is perfectly functional. You don't need this TRASHCAN to help you carry around your stuff.",
    },

    ["take/wetFlute"] = {
        "You decide to take the WEEDS back out of the FLUTE.",
    },

    ["take/wetWeeds"] = {
        "You can't just TAKE WEEDS like that.",
    },

    ["take/yellowFlute"] = {
        "You decide to take the WEEDS back out of the FLUTE.",
    },

    ["take/yellowWeeds"] = {
        "You decide to pull out the WEEDS around the ALTAR. They're so dried up that they come out very easily.",
        "You can't just TAKE WEEDS like that.",
    },

    ["talk/dragon"] = {
        "You talk to the DRAGON, trying to calm it down. It takes a while to get a word out of it, but eventually you find out that its name is FRED and that he is very scared of adventurers. His mom really believes in him though and even got him a really nice motivational card.",
        "You encourage FRED about his fitness for the job. After all, even if he's really large and chubby, he does look fearsome at the first look. He blushes and thanks you for trying, but a real final boss probably wouldn't be chatting to the adventurer that's coming to vanquish them.",
        "You try to say something to FRED, but are interrupted by his stomach rumbling. He tells you that he was waiting for you to finally come in here, but it took you so long that it's way after his usual lunch time now. He got 20 dollars from his mom though, do you want to go and eat lunch with him?",
        "FRED is still hungry and offers to take you out to lunch again. Do you want to go with him?",
    },

    ["talk/narrator"] = {
        "Don't talk back to me, just do as I say.",
    },

    ["talk/self"] = {
        "Don't talk back to the voice in your head. It's just the narrator.",
    },

    ["talk/vendingMachine"] = {
        "A hollow voice from inside the VENDING MACHINE asks \"why are you trying to talk to a vending machine\". You don't respond, as a) the question was clearly rhetorical and b) you don't really know the answer yourself.",
        "Nah, the VENDING MACHINE will just make fun of you for talking to it again.",
    },

    ["use/_bladeInTable"] = {
        "It's not much use being stuck in the table.",
    },

    ["use/_fixedPipes"] = {
        "You can't just hold it with your bare hands, the steam would scald your skin. And you're really in enough chronic pain already.",
    },

    ["use/_gumPipes"] = {
        "You can't just hold it with your bare hands, the steam would scald your skin. And you're really in enough chronic pain already.",
    },

    ["use/_holePipes"] = {
        "You can't just hold it with your bare hands, the steam would scald your skin. And you're really in enough chronic pain already.",
    },

    ["use/_nailPipes"] = {
        "You can't just hold it with your bare hands, the steam would scald your skin. And you're really in enough chronic pain already.",
    },

    ["use/altar"] = {
        "You'd rather not make sacrifices to unknown causes. Not after what happened the last time you laid naked on a stone slab.",
    },

    ["use/bowflex"] = {
        "You sit yourself down in the BOWFLEX machine and start yanking the pulleys. The pulleys tug back, lock your arms in place and start to violently stretch your muscles into shape. You scream in agony.\n\nAfter 20 minutes, your workout routine and vocal chords are finished. While you will suffer immense chronic pain for the rest of your life, your arms feel significantly stronger now.",
        "You've gotten enough muscles and anguish out of this thing.",
    },

    ["use/chewingGum"] = {
        "You can't chew it off the surface, your mouth doesn't work that way. Pick it up first.",
    },

    ["use/clapper"] = {
        "It's featureless, there's no switch or anything.",
    },

    ["use/dragon"] = {
        "You're not that close with this DRAGON.",
    },

    ["use/exitDoor"] = {
        "How? This DOOR doesn't have a handle that you could open it with.",
    },

    ["use/fire"] = {
        "Well, you'd like to extinguish this FIRE, but it's not gonna happen with your bare hands.",
    },

    ["use/flute"] = {
        "You blow into the FLUTE, but it doesn't make any noise. It does, however, make your mouth taste strangely herb-like.",
    },

    ["use/greenFlute"] = {
        "You suck on the FLUTE. It makes your mouth taste very herb-like, but nothing more. Probably because it's not lit.",
    },

    ["use/greenWeeds"] = {
        "You can't really do anything with WEEDS on their own.",
    },

    ["use/hands"] = {
        "",
    },

    ["use/jerky"] = {
        "You rip open the packet to get at your well-earned BEEF JERKY. But apparently the stuff inside is older than expected, as all the meat just crumbles to dust as soon as the air touches it.\n\nBut hey, at least you can chew on the SILICA GEL PACKET.",
    },

    ["use/lever"] = {
        "With some effort, you pull down the squeaking LEVER. A bubbling and rumbling echoes from deep within the machinery, and steam begins to hiss out from vents here and there.",
        "You pull the LEVER again.",
    },

    ["use/litGreenFlute"] = {
        "You smoke the WEEDS. It's a strange chemical taste, but oddly pleasant regardless. The chemicals are rapidly getting to your head and the room begins to spin around you.",
    },

    ["use/litYellowFlute"] = {
        "You smoke the FLUTE. It tastes terrible and gives you a headache, but nothing else. Probably because these are just WEEDS, not green.",
    },

    ["use/nail"] = {
        "On its own, a NAIL is not much use.",
    },

    ["use/narrator"] = {
        "Don't try anything funny, I could narrate you out of existence!",
    },

    ["use/painting"] = {
        "You know, normal people use art by LOOKing at it.",
    },

    ["use/pants"] = {
        "You put your PANTS on your head. But that looks silly, so you take them back off again.",
    },

    ["use/plug"] = {
        "You need to find something to PLUG if you want to use this thing.",
    },

    ["use/restroomkey"] = {
        "You triumphantly take out the KEY, only to realize that you have to USE it WITH something else for this to make sense. Man, do you feel silly now.",
    },

    ["use/self"] = {
        "You're completely useless.",
    },

    ["use/shiny"] = {
        "You could sure USE a SHINY THING like that. But you have to TAKE it first to actually do something with it.",
    },

    ["use/shirt"] = {
        "You attempt to put your shirt back on, but you just can't manage to get the right extremities through the appropriate holes. Better leave it off for now.",
    },

    ["use/silicaGelPacket"] = {
        "You need something to draw the moisture out of.",
    },

    ["use/slapChop"] = {
        "You slap the SLAP CHOP. The flimsy plastic shatters instantly and you're left with a BLADE sticking in the table.",
    },

    ["use/soot"] = {
        "None of your magic requires SOOT as a spell component. It's really quite useless.",
    },

    ["use/sparks"] = {
        "You stick your hand in the SPARKS and burn your fingers. You put them in your mouth to ease the pain and think to yourself that you should really quit doing stuff like this.",
        "No, you burned your fingers on these enough.",
    },

    ["use/statue"] = {
        "You have no USE for this STATUE, it would go terribly with the rest of your interior decoration.",
    },

    ["use/table"] = {
        "While you do feel a strange inner bond with this TABLE, you know in your heart that both of you are completely useless.",
    },

    ["use/toilet"] = {
        "You don't need it right now. And you can't go while someone is narrating your actions anyway.",
    },

    ["use/trashcan"] = {
        "You don't actually want to throw away anything, since you might need it for a puzzle later. That's called game design.",
    },

    ["use/twentyDollars"] = {
        "You'll surely buy something nice from this money. Clothes, for instance.",
    },

    ["use/vendingMachine"] = {
        "You shake the VENDING MACHINE, trying to get something out of it without paying. It doesn't work, you freeloader.",
    },

    ["use/wetFlute"] = {
        "You try to suck on the FLUTE, but the wet WEEDS have clogged it up completely.",
    },

    ["use/wetWeeds"] = {
        "You can't really do anything with WEEDS on their own.",
    },

    ["use/wetcloth"] = {
        "You squish the WET CLOTH. Some water drips out of it and makes your feet wet.",
        "You squish the WET CLOTH again, but all the excess water has already been drained from it.",
    },

    ["use/wetrag"] = {
        "You fling the WET RAG around. It makes a funny warbling sound. You could have done this all day, but then a drop of blue chemical water gets in your eye and you decide to quit.",
        "Your eye still hurts from the blue chemical water.",
    },

    ["use/yellowFlute"] = {
        "You suck on the FLUTE. It makes your mouth taste stale, but nothing else. Probably because it's not lit.",
    },

    ["use/yellowWeeds"] = {
        "You can't really do anything with WEEDS on their own.",
    },

    ["welcome"] = {
        "Welcome to adventure!\n\nYou need a keyboard to play. If you try to type stuff and nothing happens, click into the animation to give it keyboard focus.\n\nType HELP to get instructions.",
    },
}

return Data
