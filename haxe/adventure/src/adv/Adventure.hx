/*
 * Copyright (c) 2017 askmeaboutloom
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 */
package adv;

import AdventureScene;


class Adventure
{
    public var rooms:Map<String, Room> = [
        "restroom"      => new RestRoom(),
        "temple"        => new Temple(),
        "cafeteria"     => new Cafeteria(),
        "souvenierShop" => new SouvenierShop(),
        "secretPassage" => new SecretPassage(),
        "bossRoom"      => new BossRoom(),
    ];

    public var scene:AdventureScene;
    public var room :Room;
    public var inv  :Inventory;
    public var over :Bool = false;

    public var indexes = new Map<String, Int>();

    public var userData:Dynamic = {};


    public function new(s:AdventureScene)
    {
        scene = s;
        inv   = new Inventory();
    }


    public function welcome()
    {
        print(Data.messages["welcome"][0]);
    }


    public function setRoom(key:String)
    {
        room = rooms[key];
        if (!room.visited) {
            wait();
            print(room.look());
            room.visited = true;
        }

        if (scene.tripping && inv.has(Thing.nail)) {
            scene.trip = true;
            print("");
            print("You feel the effects of the WEEDS wearing off.");
        }
    }


    public function fightDragon()
    {
        wait();
        print(randomMessage(["fightDragon1"]));
        wait();
        print(randomMessage(["fightDragon2"]));
        room.remove(Thing.dragon);
        room.remove(Thing.dressShirt);
        room.add(Thing.stairs);
        room.add(Thing.brokenGlasses);
        inv.add(Thing.greetingCard);
        inv.add(Thing.twentyDollars);
    }

    public function befriendDragon()
    {
        print(randomMessage(["befriendDragon1"]));
        wait();
        print(randomMessage(["befriendDragon2"]));
        wait();
        print(randomMessage(["befriendDragon3"]));
        wait();
        gameOver();
    }

    public function gameOver()
    {
        print("");
        print("");
        print("");
        print("Congratulations!");
        print("");

        if (rooms["bossRoom"].has(Thing.dragon)) {
            print("You made it through the adventure and FRED very happy.");
        }
        else {
            print("You made it through the adventure and beat up a dragon.");
        }

        print("");

        var cried = userData.cry != null ? userData.cry : 0;
        if (cried == 0) {
            print("And you didn't even cry!");
        }
        else if (cried == 1) {
            print("And you only cried once!");
        }
        else {
            print('And you only cried $cried times!');
        }

        print("");
        print("");
        print("Thank You For Playing.");

        print("");
        print("");
        over = true;
    }


    public function index(key:String, ?value:Null<Int>):Int
    {
        if (value != null) {
            indexes[key] = value;
        }
        return indexes.exists(key) ? indexes[key] : 0;
    }


    public function print(s:String)
    {
        if (s != null) {
            scene.print(s);
        }
    }

    public function wait()
    {
        scene.wait();
    }

    static function emph(s:String):String
    {
        return '"${s.toUpperCase()}"';
    }

    function printNotFound(things:Array<String>)
    {
        var quoted = things.map(emph);
        print('I don\'t see any ${quoted.join(" or ")} here.');
    }


    function preempt(pieces:Array<String>):Bool
    {
        var key = pieces.join("/");
        if (Data.pre.exists(key)) {
            return Data.pre[key](this);
        }
        return false;
    }

    function amend(msg:String, pieces:Array<String>):String
    {
        var key = pieces.join("/");
        if (Data.amend.exists(key)) {
            return Data.amend[key](this, msg);
        }
        return msg;
    }

    function react(pieces:Array<String>):Void
    {
        var key = pieces.join("/");
        if (Data.post.exists(key)) {
            Data.post[key](this);
        }
    }


    function message(pieces:Array<String>):{idx:Int, msg:String}
    {
        var key = pieces.join("/");

        if (!indexes.exists(key)) {
            indexes[key] = 0;
        }
        else {
            indexes[key] += 1;
        }

        var idx = indexes[key];
        var msg = "";

        if (Data.messages.exists(key)) {
            var list = Data.messages[key];
            msg = idx < list.length ? list[idx] : list[list.length - 1];
            while (msg == ".rand") {
                msg = list[Std.random(list.length)];
            }
        }
        else {
            msg = null;
        }

        return {idx : idx + 1, msg : msg};
    }


    function randomMessage(pieces:Array<String>, ?dflt:String) {
        var key = pieces.join("/");

        if (!Data.messages.exists(key)) {
            return dflt;
        }

        var list = Data.messages[key];
        return list[Std.random(list.length)];
    }


    function thingFromWord(noun:String):Thing
    {
        for (r in [room, inv]) {
            var t = r.find(~/\s+/g.replace(noun, ""));
            if (t != null) {
                return t;
            }
        }
        return null;
    }


    function getVerb(type:String, raw:String)
    {
        var key = '$type/$raw';
        return Data.verbs.exists(key) ? Data.verbs[key] : raw;
    }


    public function act(raw:String)
    {
        var verb = getVerb("act", raw);

        if (verb == "look") {
            print(room.look());
        }
        else if (verb == "inventory") {
            print(inv.look());
        }
        else if (verb == "yes" && userData.expectFight) {
            combine("kill", "dragon", "hands");
        }
        else if (verb == "no" && userData.expectFight) {
            print("Didn't think so.");
        }
        else if (verb == "yes" && userData.expectFriends) {
            befriendDragon();
        }
        else if (verb == "no" && userData.expectFriends) {
            print("FRED is disappointed, but he understands. Not many "
                + "people like him, even if his mom says otherwise.");
        }
        else if (Data.messages.exists('just_$raw')) {
            print(randomMessage(['just_$raw']));
        }
        else if (Data.messages.exists('just_$verb')) {
            print(randomMessage(['just_$verb']));
        }
        else {
            print('Don\'t know how to "${raw.toUpperCase()}".');
        }

        if (verb == "cry") {
            if (userData.cry == null) {
                userData.cry = 1;
            }
            else {
                ++userData.cry;
            }
        }

        if (verb == "clap" && room.has(Thing.clapper)) {
            if (userData.clapper == null) {
                userData.clapper = 0;
            }

            if (userData.clapper < 4) {
                ++userData.clapper;
            }

            print("");
            print(randomMessage(['clapper${userData.clapper}']));

            if (userData.clapper == 3) {
                room.add(Thing.sparks);
            }
        }
    }


    public function interact(raw:String, noun:String)
    {
        var thing = thingFromWord(noun);

        if (thing == null) {
            printNotFound([noun]);
            return;
        }

        var verb = thing.resolveVerb(getVerb("interact", raw));

        if (preempt([verb, thing.id])) {
            return;
        }

        if (verb == "look" && thing == Thing.self) {
            act("inventory");
            return;
        }

        var res = message([verb, thing.id]);

        if (res.msg == null) {
            if (verb == "take" && inv.has(thing)) {
                res.msg = ".got";
            }
            else {
                res.msg = randomMessage(
                    ['no_$verb'],
                    'Don\'t know how to ${raw.toUpperCase()} that.'
                );
            }
        }

        if (res.msg == ".got") {
            res.msg = "You already got it.";
        }

        print(amend(res.msg, [verb, thing.id]));
        react([verb, thing.id, '[${res.idx}]']);
        react([verb, thing.id]);
    }


    public function combine(verb:String, a:String, b:String)
    {
        var thing = thingFromWord(a);
        var other = thingFromWord(b);

        var notFound = new Array<String>();
        if (thing == null) { notFound.push(a); }
        if (other == null) { notFound.push(b); }
        if (notFound.length != 0) {
            printNotFound(notFound);
            return;
        }

        if (thing == other) {
            print("You can't combine something with itself.");
            return;
        }

        if (other.id < thing.id) {
            var tmp = other;
            other   = thing;
            thing   = tmp;
        }

        // TODO check verb
        verb = "combine";

        if (preempt([verb, thing.id, other.id])) {
            return;
        }

        var res = message([verb, thing.id, other.id]);

        if (res.msg == null) {
            if ((res = message([verb, thing.id])).msg != null) {
                print(res.msg);
            }
            else if ((res = message([verb, other.id])).msg != null) {
                print(res.msg);
            }
            else {
                print(randomMessage(["no_combine"]));
            }
        }
        else {
            print(amend(res.msg, [verb, thing.id, other.id]));
        }

        react([verb, thing.id, other.id, '[${res.idx}]']);
        react([verb, thing.id, other.id]);
    }


    public function interpret(words:Array<String>)
    {
        if (words.length == 0) {
            print(randomMessage(["no_interpret"]));
            return;
        }

        var aggressive = Lambda.exists(words, function (s) {
            return ~/^(?:attack|beat|break|destroy|fight|kick|kill|murder|punch|smash)$/.match(s);
        });

        if (aggressive && room != rooms["bossRoom"]) {
            print(randomMessage(["just_kill"]));
        }
        else if (words.length > 1 && words[0] == "help") {
            var key = words.join("_");
            if (Data.messages.exists(key)) {
                print(randomMessage([key]));
            }
            else {
                var topic = words.slice(1).join(" ").toUpperCase();
                print('There\'s no help for "$topic".');
            }
        }
        else if (words.length == 1) {
            act(words[0]);
        }
        else if (words.length == 2) {
            interact(words[0], words[1]);
        }
        else if (words.length == 3) {
            if (words[0] == "combine" &&
                words[1] == "ice" &&
                words[2] == "cream") {
                print("That was just an example! You have neither ice "
                    + "nor cream with you.");
            }
            else {
                combine(words[0], words[1], words[2]);
            }
        }
        else {
            print(randomMessage(["no_interpret"]));
        }

        userData.expectFight       = userData.expectNextFight;
        userData.expectFriends     = userData.expectNextFriends;
        userData.expectNextFight   = false;
        userData.expectNextFriends = false;
    }
}
