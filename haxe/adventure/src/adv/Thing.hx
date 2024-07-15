package adv;

/***********************/
/* AUTO-GENERATED FILE */
/***********************/

class Thing
{
    public var id     (default, null):String;
    public var name   (default, null):String;
    public var inv    (default, null):String;
    public var aliases(default, null):Array<String>;
    public var verbs  (default, null):Map<String, String>;

    public function new(id, name, inv, aliases, verbs)
    {
        this.id      = id;
        this.name    = name;
        this.inv     = inv;
        this.verbs   = verbs;
        this.aliases = aliases;
    }

    public function like(noun:String):Bool
    {
        return aliases.indexOf(noun) != -1;
    }

    public function resolveVerb(verb:String):String
    {
        return verbs != null && verbs.exists(verb) ? verbs[verb] : verb;
    }


    public static var _bladeInTable = new Thing(
        "_bladeInTable",
        "_BLADEINTABLE",
        "_BLADEINTABLE",
        [
            "_bladeintable",
            "blade",
        ],
        [
            "pull" => "take",
        ]
    );

    public static var _emptyMachine = new Thing(
        "_emptyMachine",
        "_EMPTYMACHINE",
        "_EMPTYMACHINE",
        [
            "_emptymachine",
            "machine",
            "vendingmachine",
            "vendor",
        ],
        [
            "use" => "look",
        ]
    );

    public static var _fixedPipes = new Thing(
        "_fixedPipes",
        "_FIXEDPIPES",
        "_FIXEDPIPES",
        [
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
        ],
        [
            "block" => "use",
            "shut" => "use",
            "fix" => "use",
            "close" => "use",
            "remove" => "take",
            "hold" => "use",
        ]
    );

    public static var _gumPipes = new Thing(
        "_gumPipes",
        "_GUMPIPES",
        "_GUMPIPES",
        [
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
        ],
        [
            "hold" => "use",
            "shut" => "use",
            "block" => "use",
            "fix" => "use",
            "close" => "use",
            "remove" => "take",
        ]
    );

    public static var _holePipes = new Thing(
        "_holePipes",
        "_HOLEPIPES",
        "_HOLEPIPES",
        [
            "_holepipes",
            "hole",
            "hydraulic",
            "hydraulicpipe",
            "hydraulicpipes",
            "hydraulics",
            "mechanism",
            "pipe",
            "pipes",
        ],
        [
            "remove" => "take",
            "close" => "use",
            "fix" => "use",
            "block" => "use",
            "shut" => "use",
            "hold" => "use",
        ]
    );

    public static var _jerkyInMachine = new Thing(
        "_jerkyInMachine",
        "_JERKYINMACHINE",
        "_JERKYINMACHINE",
        [
            "_jerkyinmachine",
            "bag",
            "beef",
            "beefjerky",
            "jerky",
        ],
        [
            "buy" => "take",
        ]
    );

    public static var _nailInWall = new Thing(
        "_nailInWall",
        "_NAILINWALL",
        "_NAILINWALL",
        [
            "_nailinwall",
            "nail",
            "pin",
            "tack",
        ],
        [
            "pull" => "take",
            "use" => "take",
            "reach" => "take",
        ]
    );

    public static var _nailPipes = new Thing(
        "_nailPipes",
        "_NAILPIPES",
        "_NAILPIPES",
        [
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
        ],
        [
            "hold" => "use",
            "remove" => "take",
            "close" => "use",
            "fix" => "use",
            "block" => "use",
            "shut" => "use",
        ]
    );

    public static var altar = new Thing(
        "altar",
        "ALTAR",
        "ALTAR",
        [
            "altar",
            "alter",
        ],
        [
            "move" => "take",
            "sit" => "use",
            "push" => "take",
            "climb" => "use",
            "shove" => "take",
            "pull" => "take",
            "open" => "take",
            "drag" => "take",
            "sleep" => "use",
            "lay" => "use",
        ]
    );

    public static var ash = new Thing(
        "ash",
        "ASH",
        "ASH stuck all over everything",
        [
            "ash",
            "ashes",
        ],
        null
    );

    public static var blade = new Thing(
        "blade",
        "BLADE",
        "a dull BLADE",
        [
            "blade",
        ],
        [
            "hold" => "take",
            "use" => "take",
            "equip" => "take",
            "wield" => "take",
        ]
    );

    public static var bossRoom = new Thing(
        "bossRoom",
        "BOSSROOM",
        "",
        [
            "bossroom",
        ],
        [
            "take" => "go",
            "use" => "go",
        ]
    );

    public static var bowflex = new Thing(
        "bowflex",
        "BOWFLEX",
        "BOWFLEX",
        [
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
        ],
        [
            "pull" => "use",
            "lift" => "use",
            "tug" => "use",
            "yank" => "use",
        ]
    );

    public static var brokenGlasses = new Thing(
        "brokenGlasses",
        "BROKENGLASSES",
        "BROKENGLASSES",
        [
            "brokenglasses",
            "glass",
            "glasses",
        ],
        [
            "use" => "take",
        ]
    );

    public static var cafeteria = new Thing(
        "cafeteria",
        "CAFETERIA",
        "",
        [
            "cafe",
            "cafeteria",
            "vendeteria",
        ],
        [
            "take" => "go",
            "use" => "go",
        ]
    );

    public static var ceiling = new Thing(
        "ceiling",
        "CEILING",
        "",
        [
            "ceiling",
            "roof",
        ],
        null
    );

    public static var chewingGum = new Thing(
        "chewingGum",
        "CHEWINGGUM",
        "CHEWINGGUM",
        [
            "bubblegum",
            "chewinggum",
            "gum",
            "wad",
        ],
        [
            "chew" => "use",
            "eat" => "use",
        ]
    );

    public static var clapper = new Thing(
        "clapper",
        "CLAPPER",
        "CLAPPER",
        [
            "bulb",
            "clapper",
            "lamp",
            "light",
            "lightbulb",
        ],
        null
    );

    public static var clothes = new Thing(
        "clothes",
        "CLOTHES",
        "the CLOTHES you're wearing",
        [
            "clothes",
            "clothing",
            "pants",
            "shirt",
        ],
        [
            "drop rip tear pull" => "take",
        ]
    );

    public static var dragon = new Thing(
        "dragon",
        "DRAGON",
        "DRAGON",
        [
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
        ],
        [
            "touch" => "use",
            "hit" => "take",
            "take" => "use",
            "ask" => "talk",
            "hug" => "use",
            "make" => "talk",
            "kiss" => "use",
            "greet" => "talk",
            "encourage" => "talk",
            "murder" => "take",
            "attack" => "take",
            "flirt" => "talk",
            "sup" => "talk",
            "wrestle" => "take",
            "pick" => "use",
            "tame" => "climb",
            "fight" => "take",
            "ride" => "climb",
            "kill" => "take",
            "get" => "use",
            "use" => "climb",
            "hello" => "talk",
            "hi" => "talk",
            "yiff" => "use",
            "befriend" => "talk",
        ]
    );

    public static var dressShirt = new Thing(
        "dressShirt",
        "DRESSSHIRT",
        "DRESSSHIRT",
        [
            "card",
            "dress",
            "dressshirt",
            "greeting",
            "greetingcard",
            "shirt",
            "suit",
            "tie",
        ],
        null
    );

    public static var exitDoor = new Thing(
        "exitDoor",
        "EXITDOOR",
        "EXITDOOR",
        [
            "door",
            "exit",
            "exitdoor",
        ],
        [
            "open" => "use",
            "go" => "use",
        ]
    );

    public static var fire = new Thing(
        "fire",
        "FIRE",
        "FIRE",
        [
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
        ],
        null
    );

    public static var floor = new Thing(
        "floor",
        "FLOOR",
        "",
        [
            "earth",
            "floor",
            "floors",
            "ground",
        ],
        [
            "use" => "stand",
        ]
    );

    public static var flute = new Thing(
        "flute",
        "FLUTE",
        "a bulbous FLUTE",
        [
            "bong",
            "flute",
            "pipe",
        ],
        [
            "blow" => "use",
            "play" => "use",
            "draw" => "use",
            "smoke" => "use",
        ]
    );

    public static var greenFlute = new Thing(
        "greenFlute",
        "GREENFLUTE",
        "a FLUTE stuffed with dry, green WEEDS",
        [
            "bong",
            "flute",
            "greenflute",
            "pipe",
        ],
        [
            "empty" => "take",
            "play" => "use",
            "blow" => "use",
            "draw" => "use",
            "smoke" => "use",
        ]
    );

    public static var greenWeeds = new Thing(
        "greenWeeds",
        "GREENWEEDS",
        "a stash of dry, green WEEDS",
        [
            "greenweeds",
            "weed",
            "weeds",
        ],
        [
            "smoke" => "use",
        ]
    );

    public static var greetingCard = new Thing(
        "greetingCard",
        "GREETINGCARD",
        "a GREETING CARD",
        [
            "card",
            "greeting",
            "greetingcard",
        ],
        [
            "open" => "look",
            "read" => "look",
        ]
    );

    public static var hands = new Thing(
        "hands",
        "HANDS",
        "",
        [
            "barehand",
            "barehands",
            "hand",
            "hands",
        ],
        [
            "equip" => "take",
            "wield" => "take",
            "hold" => "take",
            "clap" => "use",
        ]
    );

    public static var hardGum = new Thing(
        "hardGum",
        "HARDGUM",
        "an old, hard wad of CHEWING GUM",
        [
            "bubblegum",
            "chewinggum",
            "gum",
            "hardchewinggum",
            "hardgum",
            "wad",
        ],
        [
            "use" => "eat",
            "chew" => "eat",
            "take" => "eat",
        ]
    );

    public static var jerky = new Thing(
        "jerky",
        "JERKY",
        "a bag of original flavor BEEF JERKY",
        [
            "bag",
            "beef",
            "beefjerky",
            "jerky",
        ],
        [
            "open" => "use",
            "rip" => "use",
            "eat" => "use",
        ]
    );

    public static var lever = new Thing(
        "lever",
        "LEVER",
        "LEVER",
        [
            "arm",
            "crank",
            "handle",
            "lever",
            "stick",
            "switch",
        ],
        [
            "push" => "use",
            "pull" => "use",
            "tug" => "use",
            "yank" => "use",
            "crank" => "use",
            "switch" => "use",
        ]
    );

    public static var litGreenFlute = new Thing(
        "litGreenFlute",
        "LITGREENFLUTE",
        "a flute stuffed with smoldering green WEEDS",
        [
            "bong",
            "flute",
            "litgreenflute",
            "pipe",
        ],
        [
            "smoke" => "use",
            "empty" => "take",
            "play" => "use",
            "blow" => "use",
            "draw" => "use",
        ]
    );

    public static var litYellowFlute = new Thing(
        "litYellowFlute",
        "LITYELLOWFLUTE",
        "a FLUTE stuffed with smoldering yellow WEEDS",
        [
            "bong",
            "flute",
            "lityellowflute",
            "pipe",
        ],
        [
            "empty" => "take",
            "blow" => "use",
            "play" => "use",
            "draw" => "use",
            "smoke" => "use",
        ]
    );

    public static var nail = new Thing(
        "nail",
        "NAIL",
        "a large NAIL",
        [
            "nail",
            "pin",
            "tack",
        ],
        [
            "chew" => "eat",
            "bite" => "eat",
        ]
    );

    public static var narrator = new Thing(
        "narrator",
        "NARRATOR",
        "",
        [
            "narator",
            "narrator",
            "storyteller",
            "voice",
        ],
        [
            "poke" => "take",
            "touch" => "take",
            "reach" => "take",
            "climb" => "take",
            "lick" => "take",
        ]
    );

    public static var painting = new Thing(
        "painting",
        "PAINTING",
        "PAINTING",
        [
            "image",
            "painting",
            "picture",
        ],
        [
            "leap" => "go",
            "jump" => "go",
            "appreciate" => "look",
            "pull" => "take",
        ]
    );

    public static var pants = new Thing(
        "pants",
        "PANTS",
        "your PANTS",
        [
            "pant",
            "pants",
            "shorts",
            "trouser",
            "trousers",
        ],
        [
            "equip" => "use",
            "wear" => "use",
            "put" => "use",
        ]
    );

    public static var plug = new Thing(
        "plug",
        "PLUG",
        "a makeshift PLUG",
        [
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
        ],
        [
            "plug" => "use",
            "bite" => "eat",
            "chew" => "eat",
        ]
    );

    public static var restroom = new Thing(
        "restroom",
        "RESTROOM",
        "",
        [
            "bathroom",
            "restroom",
            "toilet",
            "washroom",
        ],
        [
            "use" => "go",
            "take" => "go",
        ]
    );

    public static var restroomdoor = new Thing(
        "restroomdoor",
        "RESTROOMDOOR",
        "RESTROOMDOOR",
        [
            "door",
            "restroomdoor",
        ],
        [
            "take" => "go",
            "use" => "go",
            "open" => "go",
        ]
    );

    public static var restroomkey = new Thing(
        "restroomkey",
        "RESTROOMKEY",
        "a small, shiny KEY",
        [
            "key",
            "restroomkey",
            "shinykey",
            "smallkey",
            "smallshinykey",
        ],
        null
    );

    public static var room = new Thing(
        "room",
        "ROOM",
        "",
        [
            "room",
        ],
        null
    );

    public static var secretPassage = new Thing(
        "secretPassage",
        "SECRETPASSAGE",
        "",
        [
            "pass",
            "passage",
            "secret",
            "secretpass",
            "secretpassage",
            "stair",
            "stairs",
        ],
        [
            "take" => "go",
            "use" => "go",
        ]
    );

    public static var self = new Thing(
        "self",
        "SELF",
        "YOURSELF",
        [
            "inventory",
            "myself",
            "self",
        ],
        null
    );

    public static var shiny = new Thing(
        "shiny",
        "SHINY THING",
        "SHINY",
        [
            "shiny",
            "shiny thing",
            "shinything",
            "thing",
        ],
        null
    );

    public static var shirt = new Thing(
        "shirt",
        "SHIRT",
        "your SHIRT",
        [
            "shirt",
            "tshirt",
        ],
        [
            "wear" => "use",
            "put" => "use",
            "equip" => "use",
        ]
    );

    public static var silicaGelPacket = new Thing(
        "silicaGelPacket",
        "SILICAGELPACKET",
        "a SILICA GEL PACKET",
        [
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
        ],
        [
            "lick chew" => "smell",
        ]
    );

    public static var slapChop = new Thing(
        "slapChop",
        "SLAPCHOP",
        "SLAPCHOP",
        [
            "button",
            "chopper",
            "junk",
            "slapchop",
            "slapchopper",
        ],
        [
            "whack" => "use",
            "hit" => "use",
            "push" => "use",
            "press" => "use",
            "slap" => "use",
        ]
    );

    public static var softGum = new Thing(
        "softGum",
        "SOFTGUM",
        "the soft CHEWING GUM that you're chewing",
        [
            "bubblegum",
            "chewinggum",
            "gum",
            "softchewinggum",
            "softgum",
            "wad",
        ],
        [
            "use" => "eat",
            "chew" => "eat",
            "take" => "eat",
        ]
    );

    public static var soot = new Thing(
        "soot",
        "SOOT",
        "SOOT",
        [
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
        ],
        [
            "sift" => "take",
            "search" => "take",
            "find" => "take",
        ]
    );

    public static var souvenierShop = new Thing(
        "souvenierShop",
        "SOUVENIERSHOP",
        "",
        [
            "shop",
            "souveneirshop",
            "souveniershop",
            "souvenirshop",
            "store",
            "suveniershop",
            "suvenirshop",
        ],
        [
            "use" => "go",
            "take" => "go",
        ]
    );

    public static var sparks = new Thing(
        "sparks",
        "SPARKS",
        "SPARKS",
        [
            "electricity",
            "spark",
            "sparks",
        ],
        [
            "take" => "use",
            "touch" => "use",
        ]
    );

    public static var stairs = new Thing(
        "stairs",
        "STAIRS",
        "STAIRS",
        [
            "door",
            "exit",
            "stairs",
        ],
        [
            "take" => "go",
            "use" => "go",
        ]
    );

    public static var statue = new Thing(
        "statue",
        "STATUE",
        "STATUE",
        [
            "bard",
            "bardstatue",
            "statue",
        ],
        null
    );

    public static var table = new Thing(
        "table",
        "TABLE",
        "TABLE",
        [
            "table",
        ],
        [
            "stand" => "climb",
        ]
    );

    public static var temple = new Thing(
        "temple",
        "TEMPLE",
        "",
        [
            "chapel",
            "church",
            "door",
            "exit",
            "tempel",
            "temple",
        ],
        [
            "use" => "go",
            "take" => "go",
        ]
    );

    public static var toilet = new Thing(
        "toilet",
        "TOILET",
        "TOILET",
        [
            "bowl",
            "loo",
            "toilet",
            "water",
        ],
        [
            "piss" => "use",
            "sit" => "use",
            "poop" => "use",
            "go" => "use",
            "pee" => "use",
            "flush" => "use",
        ]
    );

    public static var trash = new Thing(
        "trash",
        "TRASH",
        "TRASH",
        [
            "garbage",
            "trash",
            "waste",
        ],
        null
    );

    public static var trashcan = new Thing(
        "trashcan",
        "TRASHCAN",
        "TRASHCAN",
        [
            "basket",
            "bin",
            "can",
            "dustbin",
            "garbagecan",
            "trashcan",
            "wastepaperbasket",
        ],
        null
    );

    public static var twentyDollars = new Thing(
        "twentyDollars",
        "TWENTYDOLLARS",
        "the TWENTY DOLLARS you took out of the card",
        [
            "bill",
            "bloodmoney",
            "bucks",
            "dollar",
            "dollars",
            "money",
            "twenty",
            "twentybucks",
            "twentydollars",
        ],
        null
    );

    public static var vendingMachine = new Thing(
        "vendingMachine",
        "VENDINGMACHINE",
        "VENDINGMACHINE",
        [
            "display",
            "funnel",
            "machine",
            "slot",
            "vendingmachine",
            "vendor",
        ],
        [
            "shake" => "use",
            "take" => "use",
        ]
    );

    public static var wall = new Thing(
        "wall",
        "WALL",
        "",
        [
            "tile",
            "tiles",
            "wall",
            "walls",
        ],
        null
    );

    public static var wetFlute = new Thing(
        "wetFlute",
        "WETFLUTE",
        "a FLUTE stuffed with wet, green WEEDS",
        [
            "bong",
            "flute",
            "pipe",
            "wetflute",
        ],
        [
            "smoke" => "use",
            "draw" => "use",
            "play" => "use",
            "empty" => "take",
            "blow" => "use",
        ]
    );

    public static var wetWeeds = new Thing(
        "wetWeeds",
        "WETWEEDS",
        "a wad of wet, green WEEDS",
        [
            "weed",
            "weeds",
            "wetweeds",
        ],
        [
            "smoke" => "use",
        ]
    );

    public static var wetcloth = new Thing(
        "wetcloth",
        "WET CLOTH",
        "a WET CLOTH that used to be your SHIRT",
        [
            "cloth",
            "shirt",
            "tshirt",
            "wet cloth",
            "wetcloth",
        ],
        null
    );

    public static var wetrag = new Thing(
        "wetrag",
        "WET RAG",
        "a WET RAG that used to be your PANTS",
        [
            "pant",
            "pants",
            "rag",
            "shorts",
            "trouser",
            "trousers",
            "wet rag",
            "wetrag",
        ],
        null
    );

    public static var yellowFlute = new Thing(
        "yellowFlute",
        "YELLOWFLUTE",
        "a FLUTE stuffed with dried yellow WEEDS",
        [
            "bong",
            "flute",
            "pipe",
            "yellowflute",
        ],
        [
            "smoke" => "use",
            "empty" => "take",
            "play" => "use",
            "blow" => "use",
            "draw" => "use",
        ]
    );

    public static var yellowWeeds = new Thing(
        "yellowWeeds",
        "YELLOWWEEDS",
        "a bunch of dry, yellow WEEDS",
        [
            "weed",
            "weeds",
            "yellowweeds",
        ],
        [
            "smoke" => "use",
            "pull" => "take",
        ]
    );
}
