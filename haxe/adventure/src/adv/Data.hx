package adv;

/***********************/
/* AUTO-GENERATED FILE */
/***********************/

class Data
{
    public static var stopwords:Array<String> = [
        "a",
        "at",
        "and",
        "down",
        "in",
        "into",
        "of",
        "off",
        "on",
        "onto",
        "out",
        "over",
        "the",
        "to",
        "up",
        "with",
    ];

    public static var replacements:Array<{word:String, re:EReg}> = [
        {word : "shiny", re : ~/\b(?:shiney)\b/},
        {word : "desiccant", re : ~/\b(?:dessicant|dessiccant|desicant)\b/},
        {word : "silica", re : ~/\b(?:silicon|silicone)\b/},
    ];


    public static var verbs:Map<String, String> = [
        "act/applaud" => "clap",
        "act/appologize" => "apologize",
        "act/bawl" => "cry",
        "act/check" => "look",
        "act/examine" => "look",
        "act/exit" => "die",
        "act/give" => "die",
        "act/grin" => "laugh",
        "act/ha" => "laugh",
        "act/hah" => "laugh",
        "act/haha" => "laugh",
        "act/halp" => "help",
        "act/hlp" => "help",
        "act/inspect" => "look",
        "act/investigate" => "look",
        "act/na" => "no",
        "act/nah" => "no",
        "act/naw" => "no",
        "act/nope" => "no",
        "act/quit" => "die",
        "act/see" => "look",
        "act/smile" => "laugh",
        "act/sorry" => "apologize",
        "act/sure" => "yes",
        "act/view" => "look",
        "act/watch" => "look",
        "act/whimper" => "cry",
        "act/whine" => "cry",
        "act/whinge" => "cry",
        "act/ye" => "yes",
        "act/yea" => "yes",
        "act/yeah" => "yes",
        "act/yup" => "yes",
        "interact/ascend" => "climb",
        "interact/bite" => "eat",
        "interact/boop" => "poke",
        "interact/check" => "look",
        "interact/clamber" => "climb",
        "interact/converse" => "talk",
        "interact/enter" => "go",
        "interact/examine" => "look",
        "interact/get" => "take",
        "interact/gobble" => "eat",
        "interact/goto" => "go",
        "interact/grab" => "take",
        "interact/gulp" => "drink",
        "interact/inspect" => "look",
        "interact/investigate" => "look",
        "interact/mount" => "climb",
        "interact/munch" => "eat",
        "interact/nibble" => "eat",
        "interact/pick" => "take",
        "interact/scale" => "climb",
        "interact/see" => "look",
        "interact/slurp" => "drink",
        "interact/sniff" => "smell",
        "interact/speak" => "talk",
        "interact/step" => "stand",
        "interact/stomp" => "stand",
        "interact/view" => "look",
        "interact/visit" => "go",
        "interact/walk" => "go",
        "interact/watch" => "look",
        "_DUMMY" => null,
    ];


    public static var pre:Map<String, Adventure -> Bool> = [
        "combine/blade/hands" => function (adv:Adventure):Bool {
            adv.combine("combine", "blade", "self");
            return true;
        },

        "combine/fire/pants" => function (adv:Adventure):Bool {
            if (adv.inv.has(Thing.shirt) || adv.inv.has(Thing.wetcloth)) {
                return false;
            }
            adv.print('After what happened to your SHIRT, you decide against just burning up your PANTS as well.');
            return true;
        },

        "combine/fire/shirt" => function (adv:Adventure):Bool {
            if (adv.inv.has(Thing.pants) || adv.inv.has(Thing.wetrag)) {
                return false;
            }
            adv.print('After what happened to your PANTS, you decide against just burning up your SHIRT as well.');
            return true;
        },

        "combine/flute/yellowWeeds" => function (adv:Adventure):Bool {
            if (!adv.inv.has(Thing.flute)) {
                adv.interact("take", "flute");
                adv.print("");
            }
            if (!adv.inv.has(Thing.yellowWeeds)) {
                adv.interact("take", "weeds");
                adv.print("");
            }
            return false;
        },

        "combine/greenFlute/wetWeeds" => function (adv:Adventure):Bool {
            adv.interact("take", "flute");
                            adv.print("");
                            adv.combine("combine", "flute", "weeds");
                            return true;
        },

        "combine/greenFlute/yellowWeeds" => function (adv:Adventure):Bool {
            adv.interact("take", "flute");
                            adv.print("");
                            adv.combine("combine", "flute", "weeds");
                            return true;
        },

        "combine/greenWeeds/litGreenFlute" => function (adv:Adventure):Bool {
            adv.interact("take", "flute");
                            adv.print("");
                            adv.combine("combine", "flute", "weeds");
                            return true;
        },

        "combine/greenWeeds/litYellowFlute" => function (adv:Adventure):Bool {
            adv.interact("take", "flute");
                            adv.print("");
                            adv.combine("combine", "flute", "weeds");
                            return true;
        },

        "combine/greenWeeds/wetFlute" => function (adv:Adventure):Bool {
            adv.interact("take", "flute");
                            adv.print("");
                            adv.combine("combine", "flute", "weeds");
                            return true;
        },

        "combine/greenWeeds/yellowFlute" => function (adv:Adventure):Bool {
            adv.interact("take", "flute");
                            adv.print("");
                            adv.combine("combine", "flute", "weeds");
                            return true;
        },

        "combine/litGreenFlute/wetWeeds" => function (adv:Adventure):Bool {
            adv.interact("take", "flute");
                            adv.print("");
                            adv.combine("combine", "flute", "weeds");
                            return true;
        },

        "combine/litGreenFlute/yellowWeeds" => function (adv:Adventure):Bool {
            adv.interact("take", "flute");
                            adv.print("");
                            adv.combine("combine", "flute", "weeds");
                            return true;
        },

        "combine/litYellowFlute/wetWeeds" => function (adv:Adventure):Bool {
            adv.interact("take", "flute");
                            adv.print("");
                            adv.combine("combine", "flute", "weeds");
                            return true;
        },

        "combine/litYellowFlute/yellowWeeds" => function (adv:Adventure):Bool {
            adv.interact("take", "flute");
                            adv.print("");
                            adv.combine("combine", "flute", "weeds");
                            return true;
        },

        "combine/wetFlute/yellowWeeds" => function (adv:Adventure):Bool {
            adv.interact("take", "flute");
                            adv.print("");
                            adv.combine("combine", "flute", "weeds");
                            return true;
        },

        "combine/wetWeeds/yellowFlute" => function (adv:Adventure):Bool {
            adv.interact("take", "flute");
                            adv.print("");
                            adv.combine("combine", "flute", "weeds");
                            return true;
        },

        "go/bossRoom" => function (adv:Adventure):Bool {
            if (adv.room == adv.rooms["bossRoom"]) {
                    adv.print("You're already there.");
                    return true;
                }
                return false;
        },

        "go/cafeteria" => function (adv:Adventure):Bool {
            if (adv.room == adv.rooms["cafeteria"]) {
                    adv.print("You're already there.");
                    return true;
                }
                return false;
        },

        "go/restroom" => function (adv:Adventure):Bool {
            if (adv.room == adv.rooms["restroom"]) {
                    adv.print("You're already there.");
                    return true;
                }
                return false;
        },

        "go/secretPassage" => function (adv:Adventure):Bool {
            if (adv.room == adv.rooms["secretPassage"]) {
                    adv.print("You're already there.");
                    return true;
                }
                return false;
        },

        "go/souvenierShop" => function (adv:Adventure):Bool {
            if (adv.room == adv.rooms["souvenierShop"]) {
                    adv.print("You're already there.");
                    return true;
                }
                return false;
        },

        "go/temple" => function (adv:Adventure):Bool {
            if (adv.room == adv.rooms["temple"]) {
                    adv.print("You're already there.");
                    return true;
                }
                return false;
        },

        "look/bossRoom" => function (adv:Adventure):Bool {
            if (adv.room == adv.rooms["bossRoom"]) {
                    adv.act("look");
                    return true;
                }
                return false;
        },

        "look/cafeteria" => function (adv:Adventure):Bool {
            if (adv.room == adv.rooms["cafeteria"]) {
                    adv.act("look");
                    return true;
                }
                return false;
        },

        "look/dressShirt" => function (adv:Adventure):Bool {
            if (adv.userData.lookedAtShirt == null) {
                adv.userData.lookedAtShirt = true;
                return false;
            }
            adv.interact("look", "dragon");
            return true;
        },

        "look/restroom" => function (adv:Adventure):Bool {
            if (adv.room == adv.rooms["restroom"]) {
                    adv.act("look");
                    return true;
                }
                return false;
        },

        "look/room" => function (adv:Adventure):Bool {
            adv.act("look");
            return true;
        },

        "look/secretPassage" => function (adv:Adventure):Bool {
            if (adv.room == adv.rooms["secretPassage"]) {
                    adv.act("look");
                    return true;
                }
                return false;
        },

        "look/souvenierShop" => function (adv:Adventure):Bool {
            if (adv.room == adv.rooms["souvenierShop"]) {
                    adv.act("look");
                    return true;
                }
                return false;
        },

        "look/temple" => function (adv:Adventure):Bool {
            if (adv.room == adv.rooms["temple"]) {
                    adv.act("look");
                    return true;
                }
                return false;
        },

        "take/_nailInWall" => function (adv:Adventure):Bool {
            if (!adv.scene.tripping) {
                adv.print("You can't reach it, it's way too high up.");
                return true;
            }
            return false;
        },

        "take/altar" => function (adv:Adventure):Bool {
            if (!adv.userData.strong) {
                adv.print('With all your might, you try to move the ALTAR. After minutes of pushing however, you have to come to terms with just being too weak.');
                return true;
            }
            return false;
        },

        "take/dragon" => function (adv:Adventure):Bool {
            if (!adv.userData.foughtDragon) {
                adv.print("With what? Your bare hands?");
                adv.userData.expectNextFight = true;
                return true;
            }
            return false;
        },

        "talk/dragon" => function (adv:Adventure):Bool {
            if (adv.userData.dragon == null) {
                adv.print('That DRAGON looks way too fierce and scary to talk to!');
                return true;
            }
            else if (adv.userData.dragon == 1) {
                adv.print('The DRAGON looks pretty fierce, you are scared to talk to it.');
                return true;
            }
            else if (adv.userData.dragon == 2) {
                adv.print('The DRAGON still looks a little bit too fierce for conversation.');
                return true;
            }
            return false;
        },

        "use/hands" => function (adv:Adventure):Bool {
            adv.act("clap");
            return true;
        },

        "_DUMMY" => null,
    ];


    public static var amend:Map<String, Adventure -> String -> String> = [
        "combine/blade/greenWeeds" => function (adv:Adventure, msg:String):String {
            if (adv.userData.weedSize == null) {
                    adv.userData.weedSize = 1.0;
                }
                var size = adv.userData.weedSize *= 2.0;
                return '$msg They\'re now 1/$size-sized pieces.';
        },

        "combine/blade/wetWeeds" => function (adv:Adventure, msg:String):String {
            if (adv.userData.weedSize == null) {
                    adv.userData.weedSize = 1.0;
                }
                var size = adv.userData.weedSize *= 2.0;
                return '$msg They\'re now 1/$size-sized pieces.';
        },

        "combine/blade/yellowWeeds" => function (adv:Adventure, msg:String):String {
            if (adv.userData.weedSize == null) {
                    adv.userData.weedSize = 1.0;
                }
                var size = adv.userData.weedSize *= 2.0;
                return '$msg They\'re now 1/$size-sized pieces.';
        },

        "look/altar" => function (adv:Adventure, msg:String):String {
            if (adv.room.has(Thing.secretPassage)) {
                msg = '$msg You moved it out of the way to reveal a SECRET PASSAGE underneath.';
            }
            else {
                msg = '$msg The floor behind it is scratched up really badly, suggesting that this thing has been moved around at some point.';
            }

            if (adv.room.has(Thing.yellowWeeds)) {
                msg = '$msg Some WEEDS have sprouted up through the stone at the foot of the ALTAR long ago, but they\'re all dried up and yellow now.';
            }

            return msg;
        },

        "look/clapper" => function (adv:Adventure, msg:String):String {
            if (adv.userData.clapper == null) {
                return '$msg It\'s turned off, and you don\'t see any switch or anything to turn it on.';
            }
            else if (adv.userData.clapper == 1) {
                return '$msg The bulb is glowing extraordinarily dimly.';
            }
            else if (adv.userData.clapper == 2) {
                return '$msg Even at its second intensity setting, the light is still very dim.';
            }
            else {
                return '$msg The lightbulb has exploded into 69,105 tiny pieces and SPARKS are happily flying from the filament.';
            }
        },

        "look/painting" => function (adv:Adventure, msg:String):String {
            if (adv.room.has(Thing._nailInWall)) {
                return '$msg Way at the top of it you spot that it\'s held by a single, large NAIL.';
            }
            else {
                return '$msg Since you pulled out the NAIL, the PAINTING is just sitting on the ground, leaning against the wall.';
            }
        },

        "look/statue" => function (adv:Adventure, msg:String):String {
            if (adv.room.has(Thing.flute)) {
                return '$msg In its hands is a strange, bulbous FLUTE.';
            }
            else {
                return '$msg There\'s nothing in its hands anymore.';
            }
        },

        "look/table" => function (adv:Adventure, msg:String):String {
            if (adv.room.has(Thing.chewingGum)) {
                return '$msg and actually you\'re getting so bored of looking at this thing that even the CHEWING GUM underneath it seems to be a more interesting topic.';
            }
            return '$msg and actually you\'re getting incredibly bored of looking at this thing.';
        },

        "use/lever" => function (adv:Adventure, msg:String):String {
            if (adv.room.has(Thing._holePipes)) {
                return '$msg However, instead of setting anything interesting in motion, the steam just escapes from the big hole in the PIPES. The LEVER returns to its original position, having accomplished nothing.';
            }
            else if (adv.room.has(Thing._gumPipes)) {
                return '$msg Since your CHEWING GUM only covers the rim, the steam just escapes from the hole in the PIPES, preventing the mechanism from working properly. The LEVER resets itself to its original position.';
            }
            else if (adv.room.has(Thing._nailPipes)) {
                return '$msg Since your NAIL doesn\'t sit air-tight, the steam just escapes from the hole in the PIPES, preventing the mechanism from working properly. The LEVER resets itself to its original position.';
            }
            else {
                return '$msg Your patch, literally made of rusted NAIL and CHEWING GUM, wobbles and strains precariously as the steam flows through the PIPES underneath it. Given your previous experiences with game objects spectacularly destroying themselves, you duck and cover.\n\nTo your surprise however, the patch holds and the DOOR slowly grinds open! You squeeze through it and it slams shut behind you.';
            }
        },

        "_DUMMY" => null,
    ];


    public static var post:Map<String, Adventure -> Void> = [
        "combine/_gumPipes/nail" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.nail);
            adv.room.remove(Thing._gumPipes);
            adv.room.add(Thing._fixedPipes);
        },

        "combine/_holePipes/nail" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.nail);
            adv.room.remove(Thing._holePipes);
            adv.room.add(Thing._nailPipes);
        },

        "combine/_holePipes/plug" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.plug);
            adv.room.remove(Thing._holePipes);
            adv.room.add(Thing._fixedPipes);
        },

        "combine/_holePipes/softGum" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.softGum);
            adv.room.remove(Thing._holePipes);
            adv.room.add(Thing._gumPipes);
        },

        "combine/_nailPipes/softGum" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.softGum);
            adv.room.remove(Thing._nailPipes);
            adv.room.add(Thing._fixedPipes);
        },

        "combine/ash/vendingMachine" => function (adv:Adventure):Void {
            adv.room.remove(Thing.vendingMachine);
            adv.room.remove(Thing._jerkyInMachine);
            adv.inv.remove(Thing.ash);
            adv.room.add(Thing._emptyMachine);
            adv.inv.add(Thing.jerky);
        },

        "combine/blade/chewingGum" => function (adv:Adventure):Void {
            adv.room.remove(Thing.chewingGum);
            adv.inv.remove(Thing.blade);
            adv.inv.add(Thing.hardGum);
        },

        "combine/dragon/hands" => function (adv:Adventure):Void {
            adv.fightDragon();
        },

        "combine/fire/pants" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.pants);
        },

        "combine/fire/shirt" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.shirt);
        },

        "combine/fire/wetcloth" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.wetcloth);
            adv.room.remove(Thing.fire);
            adv.room.add(Thing.soot);
        },

        "combine/fire/wetrag" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.wetrag);
            adv.room.remove(Thing.fire);
            adv.room.add(Thing.soot);
        },

        "combine/flute/greenWeeds" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.flute);
            adv.inv.add(Thing.greenFlute);
        },

        "combine/flute/wetWeeds" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.flute);
            adv.inv.add(Thing.wetFlute);
        },

        "combine/flute/yellowWeeds" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.flute);
            adv.inv.add(Thing.yellowFlute);
        },

        "combine/greenFlute/sparks" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.greenFlute);
            adv.inv.add(Thing.litGreenFlute);
        },

        "combine/nail/softGum" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.nail);
            adv.inv.remove(Thing.softGum);
            adv.inv.add(Thing.plug);
        },

        "combine/pants/toilet" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.pants);
            adv.inv.add(Thing.wetrag);
        },

        "combine/restroomdoor/restroomkey" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.restroomkey);
            adv.room.remove(Thing.restroomdoor);
            adv.room.add(Thing.temple);
            adv.inv.add(Thing.temple);
            adv.inv.add(Thing.cafeteria);
            adv.inv.add(Thing.souvenierShop);
            adv.setRoom("temple");
        },

        "combine/shirt/toilet" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.shirt);
            adv.inv.add(Thing.wetcloth);
        },

        "combine/silicaGelPacket/wetWeeds" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.silicaGelPacket);
            adv.inv.remove(Thing.wetWeeds);
            adv.inv.add(Thing.greenWeeds);
        },

        "combine/sparks/yellowFlute" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.yellowFlute);
            adv.inv.add(Thing.litYellowFlute);
        },

        "combine/toilet/yellowWeeds" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.yellowWeeds);
            adv.inv.add(Thing.wetWeeds);
        },

        "eat/hardGum" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.hardGum);
            adv.inv.add(Thing.softGum);
        },

        "go/bossRoom" => function (adv:Adventure):Void {
            adv.setRoom("bossRoom");
        },

        "go/cafeteria" => function (adv:Adventure):Void {
            adv.setRoom("cafeteria");
        },

        "go/restroom" => function (adv:Adventure):Void {
            adv.setRoom("restroom");
        },

        "go/secretPassage" => function (adv:Adventure):Void {
            adv.setRoom("secretPassage");
        },

        "go/souvenierShop" => function (adv:Adventure):Void {
            adv.setRoom("souvenierShop");
        },

        "go/stairs" => function (adv:Adventure):Void {
            adv.wait();
            adv.gameOver();
        },

        "go/temple" => function (adv:Adventure):Void {
            adv.setRoom("temple");
        },

        "look/dragon" => function (adv:Adventure):Void {
            if (adv.userData.dragon == null) {
                adv.userData.dragon = 0;
            }
            if (adv.userData.dragon < 5) {
                adv.userData.dragon++;
            }
        },

        "look/dressShirt/[1]" => function (adv:Adventure):Void {

        },

        "look/trashcan/[1]" => function (adv:Adventure):Void {
            adv.room.add(Thing.trash);
        },

        "take/_bladeInTable" => function (adv:Adventure):Void {
            adv.room.remove(Thing._bladeInTable);
            adv.inv.add(Thing.blade);
        },

        "take/_nailInWall" => function (adv:Adventure):Void {
            adv.room.remove(Thing._nailInWall);
            adv.inv.add(Thing.nail);
        },

        "take/altar/[1]" => function (adv:Adventure):Void {
            adv.room.add(Thing.secretPassage);
            adv.inv.add(Thing.secretPassage);
        },

        "take/clothes" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.clothes);
            adv.inv.add(Thing.shirt);
            adv.inv.add(Thing.pants);
        },

        "take/dragon" => function (adv:Adventure):Void {
            adv.fightDragon();
        },

        "take/flute/[1]" => function (adv:Adventure):Void {
            adv.room.remove(Thing.flute);
            adv.inv.add(Thing.flute);
        },

        "take/greenFlute" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.greenFlute);
            adv.inv.add(Thing.flute);
        },

        "take/litGreenFlute" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.litGreenFlute);
            adv.inv.add(Thing.flute);
        },

        "take/litYellowFlute" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.litYellowFlute);
            adv.inv.add(Thing.flute);
        },

        "take/shiny" => function (adv:Adventure):Void {
            adv.room.remove(Thing.shiny);
            adv.room.remove(Thing.trash);
            adv.room.remove(Thing.trashcan);
            adv.room.add(Thing.fire);
        },

        "take/soot/[1]" => function (adv:Adventure):Void {
            adv.inv.add(Thing.restroomkey);
            adv.inv.add(Thing.ash);

            var wipe:Thing = null;
            for (t in [Thing.pants, Thing.shirt, Thing.wetrag, Thing.wetcloth]) {
                if (adv.inv.has(t)) {
                    wipe = t;
                }
            }

            adv.print("");

            if (wipe != null) {
                var gen = wipe == Thing.pants ? "'" : "'s";
                adv.inv.remove(wipe);
                adv.print('You use your ${wipe.name} to clean the ASH off of it, making it shiny again. You will always remember the ${wipe.name}$gen sacrifice.');
            }
            else {
                adv.print('You dust the ASH off of it, making it shiny again.');
            }
        },

        "take/wetFlute" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.wetFlute);
            adv.inv.add(Thing.flute);
        },

        "take/yellowFlute" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.yellowFlute);
            adv.inv.add(Thing.flute);
        },

        "take/yellowWeeds/[1]" => function (adv:Adventure):Void {
            adv.room.remove(Thing.yellowWeeds);
            adv.inv.add(Thing.yellowWeeds);
        },

        "talk/dragon" => function (adv:Adventure):Void {
            if (adv.userData.dragonTalk == null) {
                adv.userData.dragonTalk = 0;
            }
            if (adv.userData.dragonTalk == 2) {
                adv.userData.expectNextFriends = true;
            }
            else {
                adv.userData.dragonTalk++;
            }
        },

        "use/bowflex" => function (adv:Adventure):Void {
            adv.userData.strong = true;
        },

        "use/jerky" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.jerky);
            adv.inv.add(Thing.silicaGelPacket);
        },

        "use/lever" => function (adv:Adventure):Void {
            if (adv.room.has(Thing._fixedPipes)) {
                adv.inv.remove(Thing.restroom);
                adv.inv.remove(Thing.temple);
                adv.inv.remove(Thing.cafeteria);
                adv.inv.remove(Thing.souvenierShop);
                adv.inv.remove(Thing.secretPassage);
                adv.setRoom("bossRoom");
            }
        },

        "use/litGreenFlute" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.litGreenFlute);
            adv.inv.remove(Thing.greenWeeds);
                adv.scene.trip = true;
                adv.scene.wait();
                adv.print("Whoah.");
        },

        "use/litYellowFlute" => function (adv:Adventure):Void {
            adv.inv.remove(Thing.litYellowFlute);
            adv.inv.add(Thing.flute);
        },

        "use/slapChop" => function (adv:Adventure):Void {
            adv.room.remove(Thing.slapChop);
            adv.room.add(Thing._bladeInTable);
        },

        "_DUMMY" => null,
    ];


    public static var messages:Map<String, Array<String>> = [
        "befriendDragon1" => [
            "FRED is very happy about that, he was starving. He invites you to ride on his back. He turns towards the exit and puts his tail in front of you to climb aboard.",
        ],

        "befriendDragon2" => [
            "You get up on FRED's back and he flies out of the exit of the cave. You two soar high above the clouds under the afternoon sun, while FRED clutches the greeting card from his mom with the twenty dollars of lunch money inside. The people at the drive-through stare in awe at the large dragon coming through, humming a cheerful tune to himself, and even more at how many milk shakes he gets for you two.",
        ],

        "befriendDragon3" => [
            "After lunch, FRED and you are way too full to go back and have a boss fight together. So you agree to just postpone that indefinitely and go home instead, to get some more comfortable (or in your case, any at all) clothes on. FRED thinks that milkshakes and a nap are a much nicer end to an adventure than beating someone up anyway, and you can't disagree with that.",
        ],

        "clapper1" => [
            "And the LAMP's bulb begins to glow! Although don't get to excited, the glow is extremely dim, the filament is barely red.",
        ],

        "clapper2" => [
            "The LAMP begins to glow ever so slightly more. It's still really dim though.",
        ],

        "clapper3" => [
            "The LAMP starts to glow properly bright now. And it keeps getting brighter until the bulb suddenly explodes in a mist of broken glass! As you open your eyes again, you see that most of the bulb has disintegrated and the filament has been exposed, which is now spraying SPARKS everywhere.",
        ],

        "clapper4" => [
            "The LAMP doesn't react to you anymore and SPARKS are still happily flying from it. The explosion probably broke the sensor.",
        ],

        "climb/dragon" => [
            "Inside a small, confined room is not a good place to ride a DRAGON.",
        ],

        "climb/painting" => [
            "There's nothing you could hold onto to do that.",
        ],

        "climb/table" => [
            "It doesn't look like it would support your weight.",
        ],

        "combine/_emptyMachine" => [
            "You'd rather not stick anything else in there, these things don't give change.",
        ],

        "combine/_fixedPipes" => [
            "That won't help you fix the PIPES.",
        ],

        "combine/_fixedPipes/flute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_fixedPipes/greenFlute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_fixedPipes/greenWeeds" => [
            "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
        ],

        "combine/_fixedPipes/hardGum" => [
            "The CHEWING GUM is rock hard, it's useless as a patch.",
        ],

        "combine/_fixedPipes/litGreenFlute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_fixedPipes/litYellowFlute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_fixedPipes/wetFlute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_fixedPipes/wetWeeds" => [
            "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
        ],

        "combine/_fixedPipes/yellowFlute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_fixedPipes/yellowWeeds" => [
            "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
        ],

        "combine/_gumPipes" => [
            "That won't help you fix the PIPES.",
        ],

        "combine/_gumPipes/flute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_gumPipes/greenFlute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_gumPipes/greenWeeds" => [
            "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
        ],

        "combine/_gumPipes/hardGum" => [
            "The CHEWING GUM is rock hard, it's useless as a patch.",
        ],

        "combine/_gumPipes/litGreenFlute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_gumPipes/litYellowFlute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_gumPipes/nail" => [
            "You stick your rusty NAIL into the hole in the PIPES. It fits pretty well, and the CHEWING GUM makes an alright seal, if you completely disregard the safety of the large hydraulic mechanism.",
        ],

        "combine/_gumPipes/wetFlute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_gumPipes/wetWeeds" => [
            "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
        ],

        "combine/_gumPipes/yellowFlute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_gumPipes/yellowWeeds" => [
            "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
        ],

        "combine/_holePipes" => [
            "That won't help you fix the PIPES.",
        ],

        "combine/_holePipes/flute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_holePipes/greenFlute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_holePipes/greenWeeds" => [
            "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
        ],

        "combine/_holePipes/hardGum" => [
            "The CHEWING GUM is rock hard, it's useless as a patch.",
        ],

        "combine/_holePipes/litGreenFlute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_holePipes/litYellowFlute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_holePipes/nail" => [
            "You stick your rusty NAIL into the hole in the PIPES. It fits pretty well, but it doesn't seal it well. There's little gaps and cracks where the steam can still escape.",
        ],

        "combine/_holePipes/plug" => [
            "You stick your makeshift PLUG into the hole in the PIPES. It seems to make an alright seal, if you completely disregard the safety of the large hydraulic mechanism.",
        ],

        "combine/_holePipes/softGum" => [
            "You take your CHEWING GUM out of your mouth and try to cover the hole in the PIPES with it. However, you don't nearly have enough, so you basically just covered the rim with it.",
        ],

        "combine/_holePipes/wetFlute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_holePipes/wetWeeds" => [
            "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
        ],

        "combine/_holePipes/yellowFlute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_holePipes/yellowWeeds" => [
            "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
        ],

        "combine/_jerkyInMachine" => [
            "You need to get it out of the VENDING MACHINE to do anything to it.",
        ],

        "combine/_nailInWall" => [
            "That won't help you reach the NAIL.",
        ],

        "combine/_nailPipes" => [
            "That won't help you fix the PIPES.",
        ],

        "combine/_nailPipes/flute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_nailPipes/greenFlute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_nailPipes/greenWeeds" => [
            "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
        ],

        "combine/_nailPipes/hardGum" => [
            "The CHEWING GUM is rock hard, it's useless as a patch.",
        ],

        "combine/_nailPipes/litGreenFlute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_nailPipes/litYellowFlute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_nailPipes/softGum" => [
            "You take your CHEWING GUM out of your mouth and stick it around the edge of the rusty NAIL. It makes an alright seal around the hole in the PIPES, if you completely disregard the safety of the large hydraulic mechanism.",
        ],

        "combine/_nailPipes/wetFlute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_nailPipes/wetWeeds" => [
            "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
        ],

        "combine/_nailPipes/yellowFlute" => [
            "Trying to patch up a hole with a holey FLUTE will never work.",
        ],

        "combine/_nailPipes/yellowWeeds" => [
            "You try to stuff your WEEDS into the hole, but it's too fiddly and you just end up throwing some of it down the PIPES.",
        ],

        "combine/ash" => [
            "Stop getting that ASH all over everything.",
        ],

        "combine/ash/vendingMachine" => [
            "You scratch together a handful of ASH from all over your INVENTORY and pour it into the funnel. The machine rattles and a hollow voice from inside says \"weird how he's still ten after all these years, isn't it.\"\n\nIt then spits out the last bag of BEEF JERKY, which you take.",
        ],

        "combine/blade" => [
            "The BLADE is way too dull to cut that.",
        ],

        "combine/blade/chewingGum" => [
            "You painstakingly scrape off the CHEWING GUM from underneath the table. It takes you 45 minutes to do it, and you curse the culprit who stuck it under here. The BLADE has become even more incredibly dull, so you just throw it away angrily.",
        ],

        "combine/blade/greenWeeds" => [
            "You cut the WEEDS into smaller pieces.",
        ],

        "combine/blade/hands" => [
            "",
        ],

        "combine/blade/self" => [
            "You feel a crawling in your skin and slash your wrists with the BLADE.\n\nOh wait no, it was just goosebumps. Good thing the BLADE is way too dull to cut through your skin.",
            "The BLADE is way too dull to even cut your skin.",
        ],

        "combine/blade/wetWeeds" => [
            "You cut the WEEDS into smaller pieces.",
        ],

        "combine/blade/yellowWeeds" => [
            "You cut the WEEDS into smaller pieces.",
        ],

        "combine/bowflex" => [
            "That doesn't need a workout.",
        ],

        "combine/ceiling" => [
            "You don't want to smash that into the CEILING.",
        ],

        "combine/chewingGum" => [
            "You can't scrape off the CHEWING GUM with that. Maybe if you'd ever worked a real job in your life, you'd already know that.",
        ],

        "combine/clothes" => [
            "Your CLOTHES are in use: you're wearing them.",
        ],

        "combine/dragon" => [
            "That won't help you against the DRAGON.",
        ],

        "combine/dragon/hands" => [
            "If you insist...",
            "You try to fight the DRAGON once more.",
        ],

        "combine/dragon/self" => [
            "You offer YOURSELF as a sacrifice. The DRAGON asks you to please not make this weird.",
            "You've been asked to not make it weird, so stop doing that now.",
        ],

        "combine/exitDoor" => [
            "You should just try pulling the LEVER instead of shoving that into the door.",
        ],

        "combine/fire/pants" => [
            "You try to drape your PANTS over the FIRE to smother it out. It seems to work for a moment, but then they just catch on FIRE as well.",
        ],

        "combine/fire/shirt" => [
            "You try to smother the flames with your SHIRT. However, the cheap fabric just catches FIRE immediately and only adds fuel to the flames.",
        ],

        "combine/fire/toilet" => [
            "You can't just bring the FIRE and water from the TOILET together like that. The former is too hot to touch, and the latter just runs through your fingers.",
        ],

        "combine/fire/wetcloth" => [
            "You throw your WET CLOTH over the fire to smother the flames. It smolders and hisses precariously - but in the end, the fire goes out!\n\nThere is just SOOT left where the TRASHCAN used to be.",
        ],

        "combine/fire/wetrag" => [
            "You throw your WET RAG over the fire to smother the flames. It smolders and hisses precariously - but in the end, the fire goes out!\n\nThere is just SOOT left where the TRASHCAN used to be.",
        ],

        "combine/floor" => [
            "You don't want to throw that on the FLOOR.",
        ],

        "combine/flute/greenWeeds" => [
            "You stuff a bit of your dry, green WEEDS into the bottom of the FLUTE. It looks very appropriate.",
        ],

        "combine/flute/painting" => [
            "You sensually rub your FLUTE against the PAINTING. It's weird, but nothing else.",
        ],

        "combine/flute/sparks" => [
            "You stick the FLUTE into the SPARKS. It achieves absolutely nothing.",
        ],

        "combine/flute/statue" => [
            "The FLUTE is of much more use to you than it is to this STATUE.",
        ],

        "combine/flute/toilet" => [
            "Since you might still want to put your mouth on the FLUTE, you'd rather not stick it in the TOILET.",
        ],

        "combine/flute/wetWeeds" => [
            "You stuff a bit of your wet, green WEEDS into the bottom of the FLUTE. It looks appropriate, but the wetness is just wrong.",
        ],

        "combine/flute/yellowWeeds" => [
            "You stuff a bit of your dry, yellow WEEDS into the bottom of the FLUTE. It looks almost appropriate somehow.",
        ],

        "combine/greenFlute/greenWeeds" => [
            "It's already full of that.",
        ],

        "combine/greenFlute/painting" => [
            "You sensually rub your FLUTE against the PAINTING. It's weird, but nothing else.",
        ],

        "combine/greenFlute/sparks" => [
            "You stick the FLUTE into the SPARKS. The WEEDS get lit up and start smoldering.",
        ],

        "combine/greenFlute/statue" => [
            "The FLUTE is of much more use to you than it is to this STATUE.",
        ],

        "combine/greenFlute/toilet" => [
            "Since you might still want to put your mouth on the FLUTE, you'd rather not stick it in the TOILET.",
        ],

        "combine/greenWeeds/sparks" => [
            "You throw some of your dry, green WEEDS into the SPARKS. They catch on fire and fill the room with a chemical smell that makes you feel a bit dizzy.",
        ],

        "combine/greenWeeds/toilet" => [
            "They've been in there enough.",
        ],

        "combine/hands" => [
            "Get your grubby hands off of that.",
        ],

        "combine/hands/self" => [
            "Stop touching yourself in front of me.",
        ],

        "combine/hands/vendingMachine" => [
            "Your arms don't fit into the VENDING MACHINE. Just pay it like a normal person would.",
        ],

        "combine/hardGum" => [
            "A hard wad of CHEWING GUM won't do any good there.",
        ],

        "combine/litGreenFlute/painting" => [
            "You sensually rub your FLUTE against the PAINTING. It's weird, but nothing else.",
        ],

        "combine/litGreenFlute/sparks" => [
            "It's already lit.",
        ],

        "combine/litGreenFlute/statue" => [
            "The FLUTE is of much more use to you than it is to this STATUE.",
        ],

        "combine/litGreenFlute/toilet" => [
            "Since you might still want to put your mouth on the FLUTE, you'd rather not stick it in the TOILET.",
        ],

        "combine/litYellowFlute/painting" => [
            "You sensually rub your FLUTE against the PAINTING. It's weird, but nothing else.",
        ],

        "combine/litYellowFlute/sparks" => [
            "It's already lit.",
        ],

        "combine/litYellowFlute/statue" => [
            "The FLUTE is of much more use to you than it is to this STATUE.",
        ],

        "combine/litYellowFlute/toilet" => [
            "Since you might still want to put your mouth on the FLUTE, you'd rather not stick it in the TOILET.",
        ],

        "combine/nail" => [
            "That doesn't need to be NAILed.",
        ],

        "combine/nail/softGum" => [
            "You take the CHEWING GUM out of your mouth and wrap it around the rusty NAIL. The result is a makeshift PLUG, or at least you tell yourself that so that it doesn't seem weird why you're just sticking random objects together.",
        ],

        "combine/narrator" => [
            "Stop using game objects on me, they leave stains.",
        ],

        "combine/painting" => [
            "Don't ruin the nice PAINTING with that.",
        ],

        "combine/painting/wetFlute" => [
            "You sensually rub your FLUTE against the PAINTING. It's weird, but nothing else.",
        ],

        "combine/painting/yellowFlute" => [
            "You sensually rub your FLUTE against the PAINTING. It's weird, but nothing else.",
        ],

        "combine/pants" => [
            "That doesn't want to wear any PANTS.",
        ],

        "combine/pants/self" => [
            "You put your PANTS on your head. But that looks silly, so you take them back off again.",
        ],

        "combine/pants/shirt" => [
            "Actually, now that you took them off, I guess it's alright to tell you: those two don't go together. Like, at all. I won't let you put them back on and have you embarrass yourself further.",
        ],

        "combine/pants/toilet" => [
            "You soak your PANTS in the TOILET water. They're basically nothing more than a WET RAG now, with a blue tint.",
        ],

        "combine/plug" => [
            "That doesn't need to be PLUGged.",
        ],

        "combine/restroomdoor/restroomkey" => [
            "You put your KEY into the DOOR - it fits! You swing it aside and gleefully stride through.",
        ],

        "combine/self/shirt" => [
            "You put your PANTS on your head. But that looks silly, so you take them back off again.",
        ],

        "combine/self/silicaGelPacket" => [
            "You wipe your brow with the SILICA GEL PACKET. It does a good job at drawing away the sweat, leaving your forehead nice and dry.",
            "You're already dry enough. You'll have to find something else to draw the moisture out of.",
        ],

        "combine/self/vendingMachine" => [
            "You don't fit into the VENDING MACHINE. Nor do any of your extremities.",
        ],

        "combine/shirt" => [
            "Don't scatter your dirty laundry everywhere.",
        ],

        "combine/shirt/toilet" => [
            "You dunk your SHIRT into the water in the bowl. It's really just a WET CLOTH now, tinted blue from the chemicals in the water.",
        ],

        "combine/silicaGelPacket" => [
            "That doesn't need the moisture drawn out of it.",
        ],

        "combine/silicaGelPacket/toilet" => [
            "It'd be pretty pointless to draw the water out of the TOILET, it would just refill with more water from the tank.",
        ],

        "combine/silicaGelPacket/wetFlute" => [
            "The SILICA GEL PACKET doesn't fit into the hole of the flute. But you could just use it with the rest of your WEEDS instead.",
        ],

        "combine/silicaGelPacket/wetWeeds" => [
            "You squish the SILICA GEL PACKET into your wad of wet WEEDS. It immediately sacrifices itself to soak up all the excess water from it. Now you have a stash of dry, green WEEDS, with all the chemicals and none of the wetness.",
        ],

        "combine/slapChop" => [
            "You don't need to chop that. It probably wouldn't fit in the SLAP CHOP anyway.",
        ],

        "combine/softGum" => [
            "You don't want to stick any CHEWING GUM on that.",
        ],

        "combine/sparks/wetFlute" => [
            "You stick the FLUTE into the SPARKS, but the WEEDS inside it are so wet that it just causes fizzling noises.",
        ],

        "combine/sparks/wetWeeds" => [
            "You throw some of your wet, green WEEDS into the SPARKS. Nothing much happens other than the SPARKS fizzling out as they touch the wet mass.",
        ],

        "combine/sparks/yellowFlute" => [
            "You stick the FLUTE into the SPARKS. The WEEDS get lit up and start smoldering, creating smoke and the smell of burning leaves.",
        ],

        "combine/sparks/yellowWeeds" => [
            "You throw some of your dry, yellow WEEDS into the SPARKS. They catch on fire and leave the unpleasant smell of burning leaves.",
        ],

        "combine/statue/wetFlute" => [
            "The FLUTE is of much more use to you than it is to this STATUE.",
        ],

        "combine/statue/yellowFlute" => [
            "The FLUTE is of much more use to you than it is to this STATUE.",
        ],

        "combine/table" => [
            "You don't want to put anything on this TABLE, it looks like it hasn't been wiped down in the last century or so.",
        ],

        "combine/toilet/wetFlute" => [
            "Since you might still want to put your mouth on the FLUTE, you'd rather not stick it in the TOILET.",
        ],

        "combine/toilet/wetWeeds" => [
            "They've been in there enough.",
        ],

        "combine/toilet/wetcloth" => [
            "That's already wet enough.",
        ],

        "combine/toilet/wetrag" => [
            "It doesn't get any wetter than it is.",
        ],

        "combine/toilet/yellowFlute" => [
            "Since you might still want to put your mouth on the FLUTE, you'd rather not stick it in the TOILET.",
        ],

        "combine/toilet/yellowWeeds" => [
            "You dunk the yellow WEEDS into the blue, perfumy water of the TOILET. When you pull them out, the chemicals have turned them bright green. They're also very wet now.",
        ],

        "combine/vendingMachine" => [
            "Trying to stick that into the VENDING MACHINE only yields you an annoying buzzing sound and the display reads \"INVALID CURRENCY\". Apparently it really does only take symbols of eternal youth.",
            "The VENDING MACHINE only takes symbols of eternal youth.",
        ],

        "combine/wall" => [
            "You don't feel like decorating the WALL with that.",
        ],

        "combine/wetFlute/wetWeeds" => [
            "It's already full of that.",
        ],

        "combine/wetcloth" => [
            "That doesn't need to be wiped down.",
        ],

        "combine/wetrag" => [
            "You don't need to clean that.",
        ],

        "combine/wetrag/wetrag" => [
            "You wouldn't know what you'd use a wet clothrag for. Or a wet ragcloth, if you're left-handed.",
        ],

        "combine/yellowFlute/yellowWeeds" => [
            "It's already full of that.",
        ],

        "drink/narrator" => [
            "I'm not liquid enough.",
        ],

        "drink/self" => [
            "You're not liquid enough.",
        ],

        "drink/toilet" => [
            "That deep blue water looks like it's about three-quarters cleaning agent, so it's probably not drinkable. Although you should probably not be drinking out of a TOILET anyway.",
        ],

        "eat/dragon" => [
            "This DRAGON looks really chubby, eating it would make your cholesterol levels go through the roof!",
        ],

        "eat/flute" => [
            "You chew on the FLUTE. It tastes like dust and clay.",
        ],

        "eat/greenFlute" => [
            "You chew on the FLUTE. It tastes like dust and clay.",
        ],

        "eat/greenWeeds" => [
            "You're pretty sure that's not how you get a kick out of WEEDS.",
        ],

        "eat/hardGum" => [
            "You pop the hard wad of CHEWING GUM into your mouth. Surprisingly, it turns back to something chewy very quickly, and even still has a nice fruit punch flavor to it.",
        ],

        "eat/litGreenFlute" => [
            "You chew on the FLUTE. It tastes like dust and clay.",
        ],

        "eat/litYellowFlute" => [
            "You chew on the FLUTE. It tastes like dust and clay.",
        ],

        "eat/nail" => [
            "Quit chewing your NAILs.",
        ],

        "eat/narrator" => [
            "No, you need to watch your sodium intake.",
        ],

        "eat/pants" => [
            "You think about eating your shorts, but you don't want to risk being sued for trademark violation.",
        ],

        "eat/plug" => [
            "You're not sure when if your tetanus shots are still good, so you resist sticking the PLUG in your mouth.",
        ],

        "eat/self" => [
            "Auto-cannibalism is not the answer.",
        ],

        "eat/silicaGelPacket" => [
            "You better not! It would draw all the moisture from your body in an instant, leaving you as nothing but a dried-up pile of carbon.",
        ],

        "eat/softGum" => [
            "You're already chewing it. Probably best to keep it in your mouth, since you wouldn't want it to stick up your inventory.",
        ],

        "eat/trash" => [
            "It being a questionable food source aside, none of this TRASH is edible.",
        ],

        "eat/wetFlute" => [
            "You chew on the FLUTE. It tastes like dust and clay.",
        ],

        "eat/wetWeeds" => [
            "You're pretty sure that's not how you get a kick out of WEEDS.",
        ],

        "eat/yellowFlute" => [
            "You chew on the FLUTE. It tastes like dust and clay.",
        ],

        "eat/yellowWeeds" => [
            "You're pretty sure that's not how you get a kick out of WEEDS.",
        ],

        "fightDragon1" => [
            "With a mighty leap, you jump up and grab the DRAGON's snout. It looks at you in surprise as you ball your hand into a fist and strike right between its eyes, leaving a nasty bruise and smashing its glasses. You handily land back on the ground, while the DRAGON reels and lands on its backside. It starts sobbing and begs you to not hurt it anymore. It can't see anything without its GLASSES, which lay broken on the floor.",
        ],

        "fightDragon2" => [
            "Amazing, you vanquished the DRAGON with your bare hands! While it's still just sitting there, crying and shivering, you search through its belongings. Its wallet only contains reward cards from supermarkets and family restaurants, but the GREETING CARD in its shirt pocket has TWENTY DOLLARS in it! You take it and yell \"now be gone, fatso!\" With a miserable howl, the DRAGON rolls to its feet, wobbles up the STAIRS and runs into the wilderness.",
        ],

        "go/bossRoom" => [
            "You somehow re-enter the BOSS ROOM.",
        ],

        "go/cafeteria" => [
            "You visit the CAFETERIA.",
        ],

        "go/fire" => [
            "You're already flaming enough.",
        ],

        "go/narrator" => [
            "Maybe you can be the narrator in some other game, if you manage get out of this one.",
        ],

        "go/painting" => [
            "You try to jump into the painting, expecting it to take you to stage 1. It doesn't work though, you just hit your head and fall to the floor.",
            "Your last interaction has disillusioned you enough already.",
        ],

        "go/restroom" => [
            "Okay, you're back in the RESTROOM.",
        ],

        "go/restroomdoor" => [
            "You grab the handle and walk forward, expecting the DOOR to yield to you. But it's locked, so you just awkwardly bump into it.",
            "The DOOR is still locked, you can't go through.",
        ],

        "go/room" => [
            "You're already there.",
        ],

        "go/secretPassage" => [
            "You make your way down the stairs of the SECRET PASSAGE.",
        ],

        "go/self" => [
            "You close your eyes and go into yourself. You return to a calm and collected state. Then you wake up from your power nap.",
            "You go into yourself again, but you're not exhausted enough to have another nap.",
        ],

        "go/souvenierShop" => [
            "You enter the unattended SOUVENIER SHOP.",
        ],

        "go/stairs" => [
            "Having heroically vanquished the DRAGON like a true adventurer, you proudly stride out of the EXIT. Clutching the TWENTY DOLLARS of lunch money in your bare hands of terror, you make your way to the nearest store to buy some new clothes and a sandwich or something. The GREETING CARD lies forgotten on the floor, since the DRAGON is sure to lose its job and its mother's support after being defeated so easily.\n\nYou ascribe pit in your stomach to the feeling of accomplishment and glory.",
        ],

        "go/statue" => [
            "You GO full BARD, dancing around and singing at the top of your lungs. But it gets exhausting quickly, so you stop doing that.",
            "No, you've realized that the BARD life isn't for you.",
        ],

        "go/temple" => [
            "You return to the TEMPLE.",
        ],

        "go/trashcan" => [
            "Aw, come on. You're not some kind of trash that sulks in a can all day. You're supposed to go out and dance in the streets, turning everyone's heads in awe, making them say: \"Wow, that's the most obnoxious piece of furry trash I've ever seen!\"",
        ],

        "help_commands" => [
            "There are three types of commands:\n\nA single word, like LOOK or INVENTORY. This will just do something, like look around the room or tell you what you have in your inventory.\n\nA verb and a noun, like LOOK AT THING or OPEN DOOR. This will try to do the action to the thing, like telling you what the thing looks like or opening the door.\n\nA verb and two nouns, like COMBINE ICE WITH CREAM. This will try to put the two things together, like producing ice cream (which is totally logical).",
        ],

        "help_common" => [
            "These are the most common commands. To save you some typing, you can abbreviate them with their first letter (like I instead of INVENTORY or U instead of USE).\n\n* INVENTORY\n\n* LOOK\n\n* LOOK/USE/TAKE/SPEAK (something)\n\n* GO (somewhere)\n\n* COMBINE (something) WITH (something else)",
        ],

        "help_game" => [
            "This is a text adventure game. You type simple commands as to what you want to do any get responses from the computer.\n\nYou progress by figuring out the inventory object puzzles. This involves picking up stuff, combining it with other stuff and using your own deductive skills.\n\nYou can't die or make the game unwinnable (even though you'll no doubt try your hardest.)",
        ],

        "help_help" => [
            "The HELP will try to HELP you if you give it a sensible topic.",
        ],

        "help_me" => [
            "You're beyond HELP.",
        ],

        "help_tips" => [
            "If you forget what's in a room, just type LOOK.\n\nPick up everything that isn't nailed down. And if it is nailed down, figure out a way to pull out the nails.\n\nYou can GO to rooms you've been to before directly, no need to traverse every room along the way.\n\nIf you're stuck, look at everything you have and read the descriptions attentively, they may give you a hint.\n\nThink outside the box and think literally - this game is made out of text after all.",
        ],

        "help_yourself" => [
            "Thank you, how considerate.",
        ],

        "just_apologize" => [
            "I forgive you.",
            "That's alright.",
            "No problem.",
            "Don't worry about it.",
            "What you've done is beyond apologies.",
        ],

        "just_ascend" => [
            "ASCEND where?",
        ],

        "just_bite" => [
            "BITE what?",
        ],

        "just_check" => [
            "CHECK what?",
        ],

        "just_clamber" => [
            "CLAMBER what?",
        ],

        "just_clap" => [
            "You clap your hands.",
        ],

        "just_climb" => [
            "CLIMB what?",
        ],

        "just_converse" => [
            "CONVERSE with whom?",
        ],

        "just_cry" => [
            "You curl into a ball on the floor and have a little time to yourself. You do feel a little better afterwards.",
            "You break out in tears at the unfairness of it all. It has no effect on the cruel world around you.",
            "You look over your shoulder, with a serious expression of desperation on your face. A single tear rolls down your cheek.",
            "You start sobbing uncontrollably. It takes several minutes before you calm down again, but you've regained some of your motivation.",
            "You lose your composure and start bawling your eyes out. You don't stop until your throat hurts and your voice is raspy. However, after having a little whinge, you feel more determined than ever.",
        ],

        "just_die" => [
            "You cannot.",
            "Nah, you're good.",
            "Surrender is not an option.",
            "There is no lose state in this game.",
            "But you still have so much to live for!",
            "Aw come on, you're not that desperate yet.",
        ],

        "just_drink" => [
            "DRINK what?",
        ],

        "just_drop" => [
            "Not right now.",
            "Quit being so lazy.",
            "You can do that later.",
            "You're not tired enough.",
            "You do that enough all day already.",
        ],

        "just_eat" => [
            "EAT what?",
        ],

        "just_enter" => [
            "ENTER where?",
        ],

        "just_examine" => [
            "EXAMINE what?",
        ],

        "just_flex" => [
            "You FLEX your muscles. It intimidates no one.",
        ],

        "just_get" => [
            "GET what?",
        ],

        "just_go" => [
            "GO where?",
        ],

        "just_gobble" => [
            "GOBBLE what?",
        ],

        "just_goto" => [
            "GOTO where?",
        ],

        "just_grab" => [
            "GRAB what?",
        ],

        "just_gulp" => [
            "GULP what?",
        ],

        "just_help" => [
            "Type a topic you want help about:\n\n* HELP GAME\n\n* HELP COMMANDS\n\n* HELP COMMON\n\n* HELP TIPS",
        ],

        "just_inspect" => [
            "INSPECT what?",
        ],

        "just_investigate" => [
            "INVESTIGATE what?",
        ],

        "just_kill" => [
            "You're too weak.",
            "Don't be so aggressive.",
            "You don't have the guts.",
            "Your strength is too low.",
            "You don't want to risk retaliation.",
            "No, you might hurt yourself doing that.",
            "Maybe you should look into your violent tendencies.",
        ],

        "just_laugh" => [
            "Aren't you a happy cookie.",
        ],

        "just_lay" => [
            "Not right now.",
            "Quit being so lazy.",
            "You can do that later.",
            "You're not tired enough.",
            "You do that enough all day already.",
        ],

        "just_laze" => [
            "Not right now.",
            "Quit being so lazy.",
            "You can do that later.",
            "You're not tired enough.",
            "You do that enough all day already.",
        ],

        "just_lie" => [
            "Not right now.",
            "Quit being so lazy.",
            "You can do that later.",
            "You're not tired enough.",
            "You do that enough all day already.",
        ],

        "just_look" => [
            "LOOK at what?",
        ],

        "just_mount" => [
            "MOUNT what?",
        ],

        "just_munch" => [
            "MUNCH what?",
        ],

        "just_nibble" => [
            "NIBBLE what?",
        ],

        "just_no" => [
            "Yes.",
            "Yup.",
            "Yeah.",
            "Mh-hm.",
            "Uh, yes.",
            "Positive.",
        ],

        "just_pick" => [
            "PICK what?",
        ],

        "just_plugh" => [
            "A hollow voice says \"nothing happens.\"",
        ],

        "just_rest" => [
            "Not right now.",
            "Quit being so lazy.",
            "You can do that later.",
            "You're not tired enough.",
            "You do that enough all day already.",
        ],

        "just_scale" => [
            "SCALE what?",
        ],

        "just_see" => [
            "SEE what?",
        ],

        "just_sit" => [
            "Not right now.",
            "Quit being so lazy.",
            "You can do that later.",
            "You're not tired enough.",
            "You do that enough all day already.",
        ],

        "just_sleep" => [
            "Not right now.",
            "Quit being so lazy.",
            "You can do that later.",
            "You're not tired enough.",
            "You do that enough all day already.",
        ],

        "just_slurp" => [
            "SLURP what?",
        ],

        "just_smell" => [
            "SMELL what?",
        ],

        "just_sniff" => [
            "SNIFF what?",
        ],

        "just_speak" => [
            "SPEAK to whom?",
        ],

        "just_stand" => [
            "STAND on what?",
        ],

        "just_step" => [
            "STEP on what?",
        ],

        "just_stomp" => [
            "STOMP on what?",
        ],

        "just_take" => [
            "TAKE what?",
        ],

        "just_talk" => [
            "TALK to whom?",
        ],

        "just_view" => [
            "VIEW what?",
        ],

        "just_visit" => [
            "VISIT what?",
        ],

        "just_walk" => [
            "WALK where?",
        ],

        "just_watch" => [
            "WATCH what?",
        ],

        "just_xyzzy" => [
            "Nothing happens.",
        ],

        "just_yes" => [
            "No.",
            "Nah.",
            "Nope.",
            "Nuh-uh.",
            "Um, no.",
            "Negatory.",
        ],

        "look/_bladeInTable" => [
            "It's the only thing that's left of the SLAP CHOP after you slapped it: a dull BLADE stuck in the table.",
        ],

        "look/_emptyMachine" => [
            "The VENDING MACHINE is empty now and the display just reads \"SOLD OUT\".",
        ],

        "look/_fixedPipes" => [
            "It's an intricate hydraulic network connected to the DOOR. Once upon a time it was probably a pretty sweet mechanism, but now it's all rusted up. You made a makeshift patch for the hole in the PIPES from a rusty NAIL and some CHEWING GUM.",
        ],

        "look/_gumPipes" => [
            "It's an intricate hydraulic network connected to the DOOR. Once upon a time it was probably a pretty sweet mechanism, but now it's all rusted up. You put some CHEWING GUM around the rim of the hole in the PIPES, but it doesn't come close to covering it.",
        ],

        "look/_holePipes" => [
            "It's an intricate hydraulic network connected to the DOOR. Once upon a time it was probably a pretty sweet mechanism, but now it's all rusted up. There's even a hole in one of the PIPES, about as big around as your wrist.",
        ],

        "look/_jerkyInMachine" => [
            "It's a lonely bag of original flavor BEEF JERKY. From the looks of it, it's the last of its kind. Who knows how long it's been in there.",
        ],

        "look/_nailInWall" => [
            "It's a big old NAIL, about the size of your hand. It's stuck way high up on the wall and holding up the PAINTING.",
        ],

        "look/_nailPipes" => [
            "It's an intricate hydraulic network connected to the DOOR. Once upon a time it was probably a pretty sweet mechanism, but now it's all rusted up. You stuck your rusty NAIL into the hole in the PIPES, but it's nowhere near airtight.",
        ],

        "look/altar" => [
            "A smooth stone ALTAR is the center piece of this TEMPLE. It's queen size, but the surface is full of burn marks and doesn't look comfortable.",
        ],

        "look/ash" => [
            "It's some ASH you somehow got in your INVENTORY when you picked up that shiny KEY of yours. And now it's just sticking over everything and you can't get rid of it all.",
        ],

        "look/blade" => [
            "It's the BLADE out of the SLAP CHOP. It's very dull.",
        ],

        "look/bossRoom" => [
            "If you want to take a look at that room, you should probably just GO there.",
        ],

        "look/bowflex" => [
            "It's some overly complicated WORKOUT EQUIPMENT that's operated with a weird pulley system attached to some weights. The sign on it reads \"BOWFLEX revolution home workout equipment - now with 20% less long-term damages!\"",
        ],

        "look/brokenGlasses" => [
            "It's the little pair of GLASSES that the DRAGON had on its nose. Your punch shattered and bent it up beyond repair.",
            "You know, the DRAGON is now wandering through the wilderness all alone, without being able to see anything. Oh, but I'm sure you did what you had to do, self defense and all that.",
            "How about next time you blow up a light bulb I don't warn you and you can't see anything anymore. How would that feel?",
            "Umm, I mean, it's just a pair of GLASSES that were broken when you... heroically vanquished the DRAGON.\n\nPlease don't hurt me.",
            "Broken GLASSES, a testament of your... heroic deeds.",
        ],

        "look/cafeteria" => [
            "If you want to take a look at that room, you should probably just GO there.",
        ],

        "look/ceiling" => [
            "It's a fascinating CEILING.",
        ],

        "look/chewingGum" => [
            "It's a pink wad of dry CHEWING GUM, firmly stuck to the underside of the TABLE.",
        ],

        "look/clapper" => [
            "It's some kind of desk lamp sitting on a podium, but it's just a bare stick, without any lampshade. A sign on the podium reads \"The Clapper - With Three Intensity Settings\".",
        ],

        "look/clothes" => [
            "Well, they're your CLOTHES. Nothing fancy. Not implying that you don't know how to dress properly, it just didn't fit the occasion. No one would expect you to wear something other than rags to a text adventure game.",
        ],

        "look/dragon" => [
            "It's a fiersome DRAGON! Its long, spiked tail twitches restlessly, its man-sized claws scrape the ground underneath and smoke is rising from its flaring nostrils. Which is fogging up the little, square glasses sitting on its nose.",
            "The large DRAGON stares back at you, looking determined and fearless. Its fingers are fiddling with his badly-tied tie, while his other hand firmly grips a greeting card in its DRESS SHIRT pocket for reassurance.",
            "It's getting kinda awkward to have you stare at the DRAGON so much. It shakily opens his mouth to say something, but then chokes on its own smoke and enters a coughing fit.",
            "The DRAGON has recovered from its coughing and is looking embarrassed. Its breath has gotten quick and it seems to be sweating nervously. The situation is getting dangerously uncomfortable.",
            "The poor little DRAGON just looks around the room, evading your stare.",
        ],

        "look/dressShirt" => [
            "The DRAGON is wearing a DRESS SHIRT that seems to be a bit too small for its chubby stature. Around its neck hangs a tie that looks like it's been tied by someone who'd never done it before. In the shirt pocket you can spot a greeting card depicting a cartoon bunny rabbit wishing the greetee all the best for a new job.",
        ],

        "look/exitDoor" => [
            "It's a large, wooden DOOR with a glowing \"exit\" sign above it. It doesn't have a handle though, instead it seems to be operated by that LEVER next to it.",
        ],

        "look/fire" => [
            "All you see is FIRE. But in the back of your mind, the SHINY THING inside it is still calling for your taking.",
        ],

        "look/floor" => [
            "Well, it sure is a FLOOR. And you're standing on it.",
        ],

        "look/flute" => [
            "It's an odd-looking, curved FLUTE with a bulbous end. It doesn't actually look like it'd make for good music, since there's no holes other than the one you blow into and the one air comes out.",
        ],

        "look/greenFlute" => [
            "It's an odd-looking, curved FLUTE with a bulbous end. It doesn't actually look like it'd make for good music, since there's no holes other than the one you blow into and the one air comes out. You stuffed some dry, green WEEDS into it",
        ],

        "look/greenWeeds" => [
            "It's a stash of dry, green WEEDS. You should probably get rid of it before you get arrested.",
        ],

        "look/greetingCard" => [
            "It's the GREETING CARD you took from the DRAGON as your spoils. It's got a cartoon bunny rabbit on the front wishing the reader all the best for a new job. On the inside, a hand-written message, encircled with a heart shape, reads \"I'm so glad you finally got a job! I'm sure you'll do just fine keeping all those adventurers out. Love, mom.\"",
        ],

        "look/hands" => [
            "They're your BARE HANDS, soft and gentle.",
        ],

        "look/hardGum" => [
            "It's old, it's hard, it's CHEWING GUM.",
        ],

        "look/jerky" => [
            "It's a packet of original flavor BEEF JERKY. Who knows how long it had been in that machine.",
        ],

        "look/lever" => [
            "It's a big LEVER connected to the mechanism of PIPES that operate the DOOR.",
        ],

        "look/litGreenFlute" => [
            "It's an odd-looking, curved FLUTE with a bulbous end. It doesn't actually look like it'd make for good music, since there's no holes other than the one you blow into and the one air comes out. The green WEEDS inside are smoldering and smoking. The chemical smell is making you feel light-headed.",
        ],

        "look/litYellowFlute" => [
            "It's an odd-looking, curved FLUTE with a bulbous end. It doesn't actually look like it'd make for good music, since there's no holes other than the one you blow into and the one air comes out. The yellow WEEDS inside it are smoldering and smoking. The burning smell is making your head hurt.",
        ],

        "look/nail" => [
            "It's a large rusty NAIL, about the size of your hand.",
        ],

        "look/narrator" => [
            "You don't see me, you can only hear my voice in your head.",
        ],

        "look/painting" => [
            "This is a 20 ft tall PAINTING depicting a handful of people sitting around a campfire, puffing smoke from their pipes.",
        ],

        "look/pants" => [
            "Well, PANTS might be stretching it. They're a pair of shorts. Basically a rag with two leg holes in it.",
        ],

        "look/plug" => [
            "It's the best (and only) PLUG you've ever made. But it's actually just a rusty NAIL with some CHEWING GUM wrapped around it.",
        ],

        "look/restroom" => [
            "If you want to take a look at that room, you should probably just GO there.",
        ],

        "look/restroomdoor" => [
            "It's a sturdy wooden DOOR. It's got like a frame and a handle and such, as you would expect.",
        ],

        "look/restroomkey" => [
            "You and this small, shiny KEY have had quite the adventure together. You went through fire and flames for each other.\n\nWell, at least one of you did, the other just got naked and dunked things in a TOILET for a while.",
        ],

        "look/room" => [
            "It's a room.",
        ],

        "look/secretPassage" => [
            "If you want to take a look at that room, you should probably just GO there.",
        ],

        "look/shiny" => [
            "Well, it's a small SHINY THING. It sits at the bottom of the TRASHCAN, amongst the still smoldering ashes of cigarette butts. You can't deny the primal instincts within you making you want to TAKE this SHINY THING with you.",
            "The SHINY THING's shininess is beckoning you to TAKE it. You might get your hands dirty but it'll totally be worth it.",
        ],

        "look/shirt" => [
            "It's one of those SHIRTs you get in a multi pack from the supermarket. The thin, gray, stringy fabric makes it look like some kind of cloth rather than something wearable.",
        ],

        "look/silicaGelPacket" => [
            "It's a SILICA GEL PACKET. One of those inedible little plastic squares that keep the moisture out of food. If you like big words with strange double letters, you may also call it a desiccant.",
        ],

        "look/slapChop" => [
            "It's a small, cylindrical plastic contraption with a button on top that reads \"slap me\". A sign above it describes it as \"The SLAP CHOP - Slap Your Food Cutting Troubles Away\".",
        ],

        "look/softGum" => [
            "You take it out of your mouth to take a look at the CHEWING GUM. It's soft, chewy and pink. You put it back into your mouth.",
            "You don't need another look at it, it's just CHEWING GUM.",
        ],

        "look/soot" => [
            "It's a bunch of SOOT left over from the TRASHCAN you lit on fire.",
        ],

        "look/souvenierShop" => [
            "If you want to take a look at that room, you should probably just GO there.",
        ],

        "look/sparks" => [
            "There's SPARKS happily spraying from the exposed filament of the ex-lightbulb. They're leaving scorch marks over the podium and floor.",
        ],

        "look/stairs" => [
            "It's the STAIRS leading out of this place, sunlight is streaming in. You hear scraps of sobbing and crying still wafting in from the outside every now and then.",
        ],

        "look/statue" => [
            "It's a life-sized STATUE made from dark marble. It depicts some kind of bard with frilly clothing a rather dopey expression.",
        ],

        "look/table" => [
            "It's a cheap, round TABLE made of plastic. The surface has one of those gray patterns that makes it look perpetually dirty, the construction of the legs is less than stellar,",
        ],

        "look/temple" => [
            "If you want to take a look at that room, you should probably just GO there.",
        ],

        "look/toilet" => [
            "Well, it's a TOILET. It's giving this room its restroom-like feel. The porcelain is sparkling clean and the water in the bowl is bright blue, giving off a perfumy scent. You feel a little light-headed from the chemicals.",
        ],

        "look/trash" => [
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
        ],

        "look/trashcan" => [
            "You peer into the TRASHCAN. It contains a bunch of TRASH in its natural habitat. However, amongst the cigarette butts at the bottom, a SHINY THING is glistening at you.",
            "There's TRASH in there, but also a SHINY THING buried in the cigarette butts at the bottom.",
        ],

        "look/twentyDollars" => [
            "It's TWENTY DOLLARS you took out of the DRAGON's GREETING CARD as your spoils of combat. Which is totally okay, you did vanquish it after all.",
            "No, it's fine, you took those TWENTY DOLLARS fair and square. It's not like the DRAGON's mother gave that to him as a present or anything.",
            "You know, maybe we should call this item \"blood money\" instead.",
            "Alright, alright! It's just a bill of TWENTY DOLLARS, please don't beat me up as well.",
            "It's... just a regular TWENTY DOLLARS.",
        ],

        "look/vendingMachine" => [
            "It's one of those weird cult edition VENDING MACHINEs. Instead of a coin slot, there is a funnel and the display above it reads \"INSERT SYMBOL OF ETERNAL YOUTH\". Inside of the machine, there is a single, lonely bag of original flavor BEEF JERKY.",
        ],

        "look/wall" => [
            "The WALL is exceedingly vertical.",
        ],

        "look/wetFlute" => [
            "It's an odd-looking, curved FLUTE with a bulbous end. It doesn't actually look like it'd make for good music, since there's no holes other than the one you blow into and the one air comes out. You stuffed some wet, green WEEDS into it",
        ],

        "look/wetWeeds" => [
            "It's a wad of wet, green WEEDS. It smells strongly of chemicals, it almost makes your head spin.",
        ],

        "look/wetcloth" => [
            "This used to be your SHIRT, but now it's a WET CLOTH. It looks pretty neat now though, the chemicals in the water made it all blue.",
        ],

        "look/wetrag" => [
            "It's your former PANTS, now a WET RAG. Aside from being much more fashionable, it's got a fancy blue color now.",
        ],

        "look/yellowFlute" => [
            "It's an odd-looking, curved FLUTE with a bulbous end. It doesn't actually look like it'd make for good music, since there's no holes other than the one you blow into and the one air comes out. You stuffed a bunch of dried, yellow WEEDS into it.",
        ],

        "look/yellowWeeds" => [
            "It's a bunch of dry, yellow WEEDS. Whatever green they had has withered long ago and now they're just yellow.",
        ],

        "no_apologize" => [
            "It doesn't seem to care for your apologies.",
        ],

        "no_cast" => [
            "You don't have enough mana.",
        ],

        "no_climb" => [
            "Your climbing skill is too low.",
            "It's not a climbable surface.",
        ],

        "no_combine" => [
            "They don't go together.",
            "Don't know how to put those two together",
        ],

        "no_drink" => [
            "It's not potable.",
            "That's undrinkable.",
            "You can't get drunk off of that.",
        ],

        "no_drop" => [
            "You're nowhere near your carrying limit.",
            "Not right now.",
            "Quit being so lazy.",
            "You can do that later.",
            "You're not tired enough.",
            "You do that enough all day already.",
        ],

        "no_eat" => [
            "It's inedible.",
            "You couldn't stomach that.",
            "That's not something you can eat.",
        ],

        "no_insult" => [
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
        ],

        "no_interpret" => [
            "Eh?",
            "What? Maybe try typing \"HELP\".",
            "I don't understand you at all.",
            "Does not compute. Please rephrase.",
            "I can't even begin to make sense of that sentence.",
        ],

        "no_lay" => [
            "Not right now.",
            "Quit being so lazy.",
            "You can do that later.",
            "You're not tired enough.",
            "You do that enough all day already.",
        ],

        "no_laze" => [
            "Not right now.",
            "Quit being so lazy.",
            "You can do that later.",
            "You're not tired enough.",
            "You do that enough all day already.",
        ],

        "no_lick" => [
            "It's unlickable.",
            "Stop that, it's rude.",
            "No, there's germs on it.",
            "You're not putting your lips on that.",
            "Quit it, we can get you a lollipop later if you really need to lick something.",
        ],

        "no_lie" => [
            "Not right now.",
            "Quit being so lazy.",
            "You can do that later.",
            "You're not tired enough.",
            "You do that enough all day already.",
        ],

        "no_look" => [
            "You don't see anything because the programmer forgot to give this thing a description. Sorry.",
        ],

        "no_poke" => [
            "It misses.",
            "It failed.",
            "You're out of poke points.",
            "You try to poke it, but it resists.",
            "It's defense is too high for your poke.",
            "You poke, but miss so badly that you just hit your own nose instead.",
        ],

        "no_reach" => [
            "And what would you do if you reached it?",
        ],

        "no_rest" => [
            "Not right now.",
            "Quit being so lazy.",
            "You can do that later.",
            "You're not tired enough.",
            "You do that enough all day already.",
        ],

        "no_sit" => [
            "Not right now.",
            "Quit being so lazy.",
            "You can do that later.",
            "You're not tired enough.",
            "You do that enough all day already.",
        ],

        "no_sleep" => [
            "Not right now.",
            "Quit being so lazy.",
            "You can do that later.",
            "You're not tired enough.",
            "You do that enough all day already.",
        ],

        "no_smell" => [
            "There's no smell to speak of.",
            "It's got a very generic smell.",
            "It smells of absolutely nothing.",
        ],

        "no_stand" => [
            "Don't put your feet all over that.",
            "It doesn't look like it could support your weight.",
        ],

        "no_take" => [
            "You don't really want it.",
            "You can't take that with you.",
            "You'd rather not carry that around with you.",
        ],

        "no_talk" => [
            "You get no response.",
            "It's not very talkative.",
        ],

        "no_touch" => [
            "It's untouchable.",
            "Just touching it won't get you anywhere.",
            "You think about rubbing your hands all over it, but then realize that that's both weird and useless.",
        ],

        "no_use" => [
            "It's utterly useless.",
            "You have no use for it.",
            "That's just not useful.",
        ],

        "smell/chewingGum" => [
            "Mmh, fruit punch!",
        ],

        "smell/dragon" => [
            "It smells of smoke and a little bit too much aftershave.",
        ],

        "smell/flute" => [
            "It smells like herbs and smoke.",
        ],

        "smell/greenFlute" => [
            "It smells like herbs and smoke.",
        ],

        "smell/hardGum" => [
            "Mmh, fruit punch!",
        ],

        "smell/jerky" => [
            "It's a sealed plastic bag, so you don't SMELL anything.",
        ],

        "smell/litGreenFlute" => [
            "It smells like herbs and smoke.",
        ],

        "smell/litYellowFlute" => [
            "It smells like herbs and smoke.",
        ],

        "smell/nail" => [
            "Notes of rust and drywall.",
        ],

        "smell/narrator" => [
            "I smell omnicient.",
        ],

        "smell/painting" => [
            "It smells unpleasantly like dry paint and smoke. Probably because it's meant to be LOOKed at, not smelled.",
        ],

        "smell/plug" => [
            "It smells great actually, the fruit punch melds really well with the notes of rust and drywall.",
        ],

        "smell/self" => [
            "You smell like yourself. I won't elaborate on that.",
        ],

        "smell/silicaGelPacket" => [
            "Mmh, a hint of processed meat, smoke flavoring and salt.",
        ],

        "smell/softGum" => [
            "You can taste it, it's fruit punch flavor. It probably smells of that too.",
        ],

        "smell/sparks" => [
            "It smells like an electrical fire.",
        ],

        "smell/table" => [
            "Ew, it smells like a decade's worth of drinks spilled in unison and never cleaned up.",
        ],

        "smell/toilet" => [
            "It smells very, very clean. Like someone used a massively corrosive substance to ensure no living thing would get near this TOILET. In fact, you're getting quite the headache from smelling it, so you decide to stop doing that.",
            "To avoid permanent brain damage, you'd rather not SMELL that stuff again. Those chemicals really pack a punch.",
        ],

        "smell/trash" => [
            "Ew, smells like this TRASH is soaked in gasoline.",
        ],

        "smell/trashcan" => [
            "It smells like gasoline. Which is kinda odd for a restroom trashcan, but why are you smelling it anyway.",
        ],

        "smell/wetFlute" => [
            "It smells like herbs and smoke.",
        ],

        "smell/yellowFlute" => [
            "It smells like herbs and smoke.",
        ],

        "stand/ceiling" => [
            "Your current gravity situation does not allow for it.",
        ],

        "stand/fire" => [
            "Since you're barefoot, stepping on the FIRE is a really bad idea.",
        ],

        "stand/floor" => [
            "You're standing on it already.",
        ],

        "stand/self" => [
            "You stand on your own foot. It hurts.",
        ],

        "stand/toilet" => [
            "You don't want to get your feet wet, you'll catch a cold.",
        ],

        "stand/wall" => [
            "The WALL's verticality prevents you from doing that.",
        ],

        "take/_bladeInTable" => [
            "You pull the BLADE out of the table. It's so dull that you don't have to worry about it damaging anything else in your INVENTORY.",
        ],

        "take/_fixedPipes" => [
            "No, it's good where it's at.",
        ],

        "take/_gumPipes" => [
            "No, it's good where it's at.",
        ],

        "take/_holePipes" => [
            "No, it's good where it's at.",
        ],

        "take/_jerkyInMachine" => [
            "You need to pay the VENDING MACHINE to get the BEEF JERKY.",
        ],

        "take/_nailInWall" => [
            "You pull the NAIL out of the wall with relative ease. The PAINTING falls to the ground with a thump.",
        ],

        "take/_nailPipes" => [
            "No, it's good where it's at.",
        ],

        "take/altar" => [
            "With your new-found strength, you stem yourself against the ALTAR. Inch by inch, you manage to push it back far enough to reveal a SECRET PASSAGE! You let out a scream of victory, hoping that you can convince yourself that this was worth all the pain and suffering.",
            "You put enough effort into moving it once already.",
        ],

        "take/blade" => [
            "You wield the BLADE (1d4 nonlethal bludgeoning damage).",
            "It's already equipped.",
        ],

        "take/bowflex" => [
            "Nah, you'd probably use it once or twice and then it would sit in the corner gathering dust. Just like your other workout equipment.",
        ],

        "take/brokenGlasses" => [
            "You don't want these GLASSES, they're way uncool and also broken.",
        ],

        "take/chewingGum" => [
            "You desparately scratch at the CHEWING GUM with your fingernails, but it's too firmly stuck to the surface to pull it of that way.",
            "You still can't pull it off with your bare hands.",
        ],

        "take/clapper" => [
            "It's firmly affixed to its podium, and even the bulb is glued in place.",
        ],

        "take/clothes" => [
            "Alright then. You take off your SHIRT and PANTS. Exposed to the raw elements, your underwear immediately disintegrates into a fine mist, leaving you naked.",
        ],

        "take/dragon" => [
            "You try to fight the DRAGON once more.",
        ],

        "take/dressShirt" => [
            "It's way too big for you. Besides, you'd probably just ruin it like you did your own clothes.",
        ],

        "take/fire" => [
            "You reach into the FIRE and burn your fingers. They hurt now and you feel a little sad.",
            "You remember what happened last time you tried to put your hands into the FIRE. The feeling of a little sadness washes over you and you decide not to do it again.",
        ],

        "take/flute" => [
            "You grab the FLUTE the STATUE is holding and yank it out. It's surprisingly easy, as if it's meant to be detachable.",
            ".got",
        ],

        "take/greenFlute" => [
            "You decide to take the WEEDS back out of the FLUTE.",
        ],

        "take/greenWeeds" => [
            "You can't just TAKE WEEDS like that.",
        ],

        "take/hands" => [
            "You wield your BARE HANDS (1 nonlethal poking damage, -2 confidence bonus to all attack and damage rolls).",
        ],

        "take/litGreenFlute" => [
            "You decide to take the WEEDS back out of the FLUTE.",
        ],

        "take/litYellowFlute" => [
            "You decide to take the WEEDS back out of the FLUTE.",
        ],

        "take/nail" => [
            ".got",
        ],

        "take/narrator" => [
            "You can't reach me.",
        ],

        "take/painting" => [
            "This thing is way too heavy to drag around with you.",
        ],

        "take/pants" => [
            "You won't achieve anything by taking off your pants just to put them back on later. Just look where it got you in real life.",
        ],

        "take/restroomkey" => [
            "After what you went through, you'll take this KEY to the end of the world! Or at least until you USE it on something and it disappears from your INVENTORY.",
        ],

        "take/self" => [
            "No one can take you away from me.",
        ],

        "take/shiny" => [
            "You reach into the TRASHCAN and grab the SHINY THING at the bottom - it feels smooth and metal, just like a SHINY THING should. However, as you pull it up, a spark releases from the cigarette butts around it. It ignites the TRASH and the whole TRASHCAN bursts into flames!\n\nYou're fine, but needless to say, you didn't get the SHINY THING. You only started a FIRE.",
        ],

        "take/shirt" => [
            "You already took it off. And you're not gonna get to put it back on, you stay naked and think about the consequences of your actions.",
        ],

        "take/slapChop" => [
            "It's glued to the table. But actually, you don't want to chop small amounts of food via domestic violence anyway.",
        ],

        "take/soot" => [
            "You rummage around in the SOOT, looking for that elusive SHINY THING you saw before. Eventually, your fingers grasp the metal thing and you triumphantly pull it towards you: It's a small metal KEY!",
            "You already found the KEY, no need to get your hands any dirtier than they are.",
        ],

        "take/statue" => [
            "If this STATUE were alive, you might TAKE it with you. But until you learn that animate object spell, that's not gonna happen.",
        ],

        "take/table" => [
            "This TABLE isn't hip enough to be part of your collection of furniture.",
        ],

        "take/toilet" => [
            "It's firmly anchored to the wall. You rationalize your failure by arguing that you would look pretty silly carrying a TOILET around with you.",
        ],

        "take/trash" => [
            "While this is an adventure game, you don't need to carry literal TRASH around with you.",
        ],

        "take/trashcan" => [
            "Your INVENTORY is perfectly functional. You don't need this TRASHCAN to help you carry around your stuff.",
        ],

        "take/wetFlute" => [
            "You decide to take the WEEDS back out of the FLUTE.",
        ],

        "take/wetWeeds" => [
            "You can't just TAKE WEEDS like that.",
        ],

        "take/yellowFlute" => [
            "You decide to take the WEEDS back out of the FLUTE.",
        ],

        "take/yellowWeeds" => [
            "You decide to pull out the WEEDS around the ALTAR. They're so dried up that they come out very easily.",
            "You can't just TAKE WEEDS like that.",
        ],

        "talk/dragon" => [
            "You talk to the DRAGON, trying to calm it down. It takes a while to get a word out of it, but eventually you find out that its name is FRED and that he is very scared of adventurers. His mom really believes in him though and even got him a really nice motivational card.",
            "You encourage FRED about his fitness for the job. After all, even if he's really large and chubby, he does look fearsome at the first look. He blushes and thanks you for trying, but a real final boss probably wouldn't be chatting to the adventurer that's coming to vanquish them.",
            "You try to say something to FRED, but are interrupted by his stomach rumbling. He tells you that he was waiting for you to finally come in here, but it took you so long that it's way after his usual lunch time now. He got 20 dollars from his mom though, do you want to go and eat lunch with him?",
            "FRED is still hungry and offers to take you out to lunch again. Do you want to go with him?",
        ],

        "talk/narrator" => [
            "Don't talk back to me, just do as I say.",
        ],

        "talk/self" => [
            "Don't talk back to the voice in your head. It's just the narrator.",
        ],

        "talk/vendingMachine" => [
            "A hollow voice from inside the VENDING MACHINE asks \"why are you trying to talk to a vending machine\". You don't respond, as a) the question was clearly rhetorical and b) you don't really know the answer yourself.",
        ],

        "use/_bladeInTable" => [
            "It's not much use being stuck in the table.",
        ],

        "use/_fixedPipes" => [
            "You can't just hold it with your bare hands, the steam would scald your skin. And you're really in enough chronic pain already.",
        ],

        "use/_gumPipes" => [
            "You can't just hold it with your bare hands, the steam would scald your skin. And you're really in enough chronic pain already.",
        ],

        "use/_holePipes" => [
            "You can't just hold it with your bare hands, the steam would scald your skin. And you're really in enough chronic pain already.",
        ],

        "use/_nailPipes" => [
            "You can't just hold it with your bare hands, the steam would scald your skin. And you're really in enough chronic pain already.",
        ],

        "use/altar" => [
            "You'd rather not make sacrifices to unknown causes. Not after what happened the last time you laid naked on a stone slab.",
        ],

        "use/bowflex" => [
            "You sit yourself down in the BOWFLEX machine and start yanking the pulleys. The pulleys tug back, lock your arms in place and start to violently stretch your muscles into shape. You scream in agony.\n\nAfter 20 minutes, your workout routine and vocal chords are finished. While you will suffer immense chronic pain for the rest of your life, your arms feel significantly stronger now.",
            "You've gotten enough muscles and anguish out of this thing.",
        ],

        "use/chewingGum" => [
            "You can't chew it off the surface, your mouth doesn't work that way. Pick it up first.",
        ],

        "use/clapper" => [
            "It's featureless, there's no switch or anything.",
        ],

        "use/dragon" => [
            "You're not that close with this DRAGON.",
        ],

        "use/exitDoor" => [
            "How? This DOOR doesn't have a handle that you could open it with.",
        ],

        "use/fire" => [
            "Your spell level is too low to wield FIRE magic.",
        ],

        "use/flute" => [
            "You blow into the FLUTE, but it doesn't make any noise. It does, however, make your mouth taste strangely herb-like.",
        ],

        "use/greenFlute" => [
            "You suck on the FLUTE. It makes your mouth taste very herb-like, but nothing more. Probably because it's not lit.",
        ],

        "use/greenWeeds" => [
            "You can't really do anything with WEEDS on their own.",
        ],

        "use/hands" => [
            "",
        ],

        "use/jerky" => [
            "You rip open the packet to get at your well-earned BEEF JERKY. But apparently the stuff inside is older than expected, as all the meat just crumbles to dust as soon as the air touches it.\n\nBut hey, at least you can chew on the SILICA GEL PACKET.",
        ],

        "use/lever" => [
            "With some effort, you pull down the squeaking LEVER. A bubbling and rumbling echoes from deep within the machinery, and steam begins to hiss out from vents here and there.",
            "You pull the LEVER again.",
        ],

        "use/litGreenFlute" => [
            "You smoke the WEEDS. It's a strange chemical taste, but oddly pleasant regardless. The chemicals are rapidly getting to your head and the room begins to spin around you.",
        ],

        "use/litYellowFlute" => [
            "You smoke the FLUTE. It tastes terrible and gives you a headache, but nothing else. Probably because these are just WEEDS, not green.",
        ],

        "use/nail" => [
            "On its own, a NAIL is not much use.",
        ],

        "use/narrator" => [
            "Don't try anything funny, I could narrate you out of existence!",
        ],

        "use/painting" => [
            "You know, normal people use art by LOOKing at it.",
        ],

        "use/pants" => [
            "You put your PANTS on your head. But that looks silly, so you take them back off again.",
        ],

        "use/plug" => [
            "You need to find something to PLUG if you want to use this thing.",
        ],

        "use/restroomkey" => [
            "You triumphantly take out the KEY, only to realize that you have to USE it WITH something else for this to make sense. Man, do you feel silly now.",
        ],

        "use/self" => [
            "You're completely useless.",
        ],

        "use/shiny" => [
            "You could sure USE a SHINY THING like that. But you have to TAKE it first to actually do something with it.",
        ],

        "use/shirt" => [
            "You attempt to put your shirt back on, but you just can't manage to get the right extremities through the appropriate holes. Better leave it off for now.",
        ],

        "use/silicaGelPacket" => [
            "You need something to draw the moisture out of.",
        ],

        "use/slapChop" => [
            "You slap the SLAP CHOP. The flimsy plastic shatters instantly and you're left with a BLADE sticking in the table.",
        ],

        "use/soot" => [
            "None of your magic requires SOOT as a spell component. It's really quite useless.",
        ],

        "use/sparks" => [
            "You stick your hand in the SPARKS and burn your fingers. You put them in your mouth to ease the pain and think to yourself that you should really quit doing stuff like this.",
            "No, you burned your fingers on these enough.",
        ],

        "use/statue" => [
            "You have no USE for this STATUE, it would go terribly with the rest of your interior decoration.",
        ],

        "use/table" => [
            "While you do feel a strange inner bond with this TABLE, you know in your heart that both of you are completely useless.",
        ],

        "use/toilet" => [
            "You don't need it right now. And you can't go while someone is narrating your actions anyway.",
        ],

        "use/trashcan" => [
            "You don't actually want to throw away anything, since you might need it for a puzzle later. That's called game design.",
        ],

        "use/twentyDollars" => [
            "You'll surely buy something nice from this money. Clothes, for instance.",
        ],

        "use/vendingMachine" => [
            "You shake the VENDING MACHINE, trying to get something out of it without paying. It doesn't work, you freeloader.",
        ],

        "use/wetFlute" => [
            "You try to suck on the FLUTE, but the wet WEEDS have clogged it up completely.",
        ],

        "use/wetWeeds" => [
            "You can't really do anything with WEEDS on their own.",
        ],

        "use/wetcloth" => [
            "You squish the WET CLOTH. Some water drips out of it and makes your feet wet.",
            "You squish the WET CLOTH again, but all the excess water has already been drained from it.",
        ],

        "use/wetrag" => [
            "You fling the WET RAG around. It makes a funny warbling sound. You could have done this all day, but then a drop of blue chemical water gets in your eye and you decide to quit.",
            "Your eye still hurts from the blue chemical water.",
        ],

        "use/yellowFlute" => [
            "You suck on the FLUTE. It makes your mouth taste stale, but nothing else. Probably because it's not lit.",
        ],

        "use/yellowWeeds" => [
            "You can't really do anything with WEEDS on their own.",
        ],

        "welcome" => [
            "Welcome to adventure! Type HELP to get instructions.",
        ],

        "_DUMMY" => null,
    ];
}
