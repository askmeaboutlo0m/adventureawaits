# Copyright (c) 2017 askmeaboutloom
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.
use Adv;


Thing toilet => sub {
    Alias qw(loo bowl water);
    AsUse qw(go sit pee piss poop flush);

    Look q(
        Well, it's a TOILET. It's giving this room its restroom-like feel. The
        porcelain is sparkling clean and the water in the bowl is bright blue,
        giving off a perfumy scent. You feel a little light-headed from the
        chemicals.
    );

    Take q(
        It's firmly anchored to the wall. You rationalize your failure by
        arguing that you would look pretty silly carrying a TOILET around with
        you.
    );

    Use q(
        You don't need it right now. And you can't go while someone is
        narrating your actions anyway.
    );

    Drink q(
        That deep blue water looks like it's about three-quarters cleaning
        agent, so it's probably not drinkable. Although you should probably not
        be drinking out of a TOILET anyway.
    );

    Smell q(
        It smells very, very clean. Like someone used a massively corrosive
        substance to ensure no living thing would get near this TOILET. In
        fact, you're getting quite the headache from smelling it, so you decide
        to stop doing that.
    );
    Smell q(
        To avoid permanent brain damage, you'd rather not SMELL that stuff
        again. Those chemicals really pack a punch.
    );

    Stand q(
        You don't want to get your feet wet, you'll catch a cold.
    );

    With shirt => q(
        You dunk your SHIRT into the water in the bowl. It's really just a WET
        CLOTH now, tinted blue from the chemicals in the water.
    );
    With pants => q(
        You soak your PANTS in the TOILET water. They're basically nothing more
        than a WET RAG now, with a blue tint.
    );

    OnCombine shirt => '~shirt ^wetcloth';
    OnCombine pants => '~pants ^wetrag';
};


Thing restroomdoor => sub {
    Alias qw(door);
    AsGo qw(open use take);

    Look q(
        It's a sturdy wooden DOOR. It's got like a frame and a handle and such,
        as you would expect.
    );

    Go q(
        You grab the handle and walk forward, expecting the DOOR to yield to
        you. But it's locked, so you just awkwardly bump into it.
    );
    Go q(
        The DOOR is still locked, you can't go through.
    );
};


Thing trashcan => sub {
    Alias qw(garbagecan wastepaperbasket dustbin can bin basket);

    Look q(
        You peer into the TRASHCAN. It contains a bunch of TRASH in its
        natural habitat. However, amongst the cigarette butts at the bottom,
        a SHINY THING is glistening at you.
    );
    Look q(
        There's TRASH in there, but also a SHINY THING buried in the cigarette
        butts at the bottom.
    );

    Take q(
        Your INVENTORY is perfectly functional. You don't need this TRASHCAN to
        help you carry around your stuff.
    );

    Use q(
        You don't actually want to throw away anything, since you might need it
        for a puzzle later. That's called game design.
    );

    Go q(
        Aw, come on. You're not some kind of trash that sulks in a can all day.
        You're supposed to go out and dance in the streets, turning everyone's
        heads in awe, making them say: "Wow, that's the most obnoxious piece of
        furry trash I've ever seen!"
    );

    Smell q(
        It smells like gasoline. Which is kinda odd for a restroom trashcan,
        but why are you smelling it anyway.
    );

    OnceLook '+trash';
};


Thing trash => sub {
    Alias qw(garbage waste);

    Look "It's just TRASH. Wads of paper and such.";
    Look "Just TRASH. Like bits of cardboard.";
    Look "There's also some wood shavings in this TRASH.";
    Look "Nothing but TRASH. Paper towels for instance.";
    Look "Some cans of hair spray are in this TRASH too.";
    Look "Really, just TRASH here. Tinder for example.";
    Look "Someone dumped their fireworks in this TRASH.";
    Look "Boxes of matches also fester amongst the TRASH.";
    Look "Still just TRASH. Gunpowder is stuck all over it.";
    Look "Only TRASH. Like half-empty kerosine bottles.";
    Look ".rand";

    Take q(
        While this is an adventure game, you don't need to carry literal TRASH
        around with you.
    );

    Smell q(
        Ew, smells like this TRASH is soaked in gasoline.
    );

    Eat q(
        It being a questionable food source aside, none of this TRASH is
        edible.
    );
};


Replace shiny => 'shiney';

Thing shiny => sub {
    Name 'SHINY THING';
    Alias qw(shinything shiny thing);

    Look q(
        Well, it's a small SHINY THING. It sits at the bottom of the TRASHCAN,
        amongst the still smoldering ashes of cigarette butts. You can't deny
        the primal instincts within you making you want to TAKE this SHINY
        THING with you.
    );
    Look q(
        The SHINY THING's shininess is beckoning you to TAKE it. You might get
        your hands dirty but it'll totally be worth it.
    );

    Take q(
        You reach into the TRASHCAN and grab the SHINY THING at the bottom - it
        feels smooth and metal, just like a SHINY THING should. However, as you
        pull it up, a spark releases from the cigarette butts around it. It
        ignites the TRASH and the whole TRASHCAN bursts into flames!

        You're fine, but needless to say, you didn't get the SHINY THING. You
        only started a FIRE.
    );

    Use q(
        You could sure USE a SHINY THING like that. But you have to TAKE it
        first to actually do something with it.
    );

    OnTake '-shiny -trash -trashcan +fire';
};


Thing fire => sub {
    Alias qw(
        flames shinything shiny thing garbagecan wastepaperbasket dustbin
        can bin basket
    );

    Look q(
        All you see is FIRE. But in the back of your mind, the SHINY THING
        inside it is still calling for your taking.
    );

    Take q(
        You reach into the FIRE and burn your fingers. They hurt now and you
        feel a little sad.
    );
    Take q(
        You remember what happened last time you tried to put your hands into
        the FIRE. The feeling of a little sadness washes over you and you
        decide not to do it again.
    );

    Use q(
        Your spell level is too low to wield FIRE magic.
    );

    Go q(
        You're already flaming enough.
    );

    Stand q(
        Since you're barefoot, stepping on the FIRE is a really bad idea.
    );

    With toilet => q(
        You can't just bring the FIRE and water from the TOILET together like
        that. The former is too hot to touch, and the latter just runs through
        your fingers.
    );
    With shirt => q(
        You try to smother the flames with your SHIRT. However, the cheap
        fabric just catches FIRE immediately and only adds fuel to the flames.
    );
    With pants => q(
        You try to drape your PANTS over the FIRE to smother it out. It seems
        to work for a moment, but then they just catch on FIRE as well.
    );

    PreCombine shirt => q{
        if (adv.inv.has(Thing.pants) || adv.inv.has(Thing.wetrag)) {
            return false;
        }
        adv.print(q(
            After what happened to your PANTS, you decide against just burning
            up your SHIRT as well.
        ));
        return true;
    };

    PreCombine pants => q{
        if (adv.inv.has(Thing.shirt) || adv.inv.has(Thing.wetcloth)) {
            return false;
        }
        adv.print(q(
            After what happened to your SHIRT, you decide against just burning
            up your PANTS as well.
        ));
        return true;
    };

    OnCombine shirt => '~shirt';
    OnCombine pants => '~pants';
};


Thing wetcloth => sub {
    Name 'WET CLOTH';
    Inv 'a WET CLOTH that used to be your SHIRT';
    Alias qw(wetcloth cloth shirt tshirt);

    Look q(
        This used to be your SHIRT, but now it's a WET CLOTH. It looks pretty
        neat now though, the chemicals in the water made it all blue.
    );

    Use q(
        You squish the WET CLOTH. Some water drips out of it and makes your
        feet wet.
    );
    Use q(
        You squish the WET CLOTH again, but all the excess water has already
        been drained from it.
    );

    With toilet => q(
        That's already wet enough.
    );

    With fire => q(
        You throw your WET CLOTH over the fire to smother the flames. It
        smolders and hisses precariously - but in the end, the fire goes out!

        There is just SOOT left where the TRASHCAN used to be.
    );

    WithAny q(
        That doesn't need to be wiped down.
    );

    OnCombine fire => '~wetcloth -fire +soot';
};


Thing wetrag => sub {
    Name 'WET RAG';
    Inv 'a WET RAG that used to be your PANTS';
    Alias qw(wetrag rag pants pant trouser trousers shorts);

    Look q(
        It's your former PANTS, now a WET RAG. Aside from being much more
        fashionable, it's got a fancy blue color now.
    );

    Use q(
        You fling the WET RAG around. It makes a funny warbling sound. You
        could have done this all day, but then a drop of blue chemical water
        gets in your eye and you decide to quit.
    );
    Use q(
        Your eye still hurts from the blue chemical water.
    );

    With toilet => q(
        It doesn't get any wetter than it is.
    );

    With wetrag => q(
        You wouldn't know what you'd use a wet clothrag for. Or a wet ragcloth,
        if you're left-handed.
    );

    With fire => q(
        You throw your WET RAG over the fire to smother the flames. It smolders
            and hisses precariously - but in the end, the fire goes out!

        There is just SOOT left where the TRASHCAN used to be.
    );

    WithAny q(
        You don't need to clean that.
    );

    OnCombine fire => '~wetrag -fire +soot';
};


Thing soot => sub {
    Alias qw(
        garbagecan wastepaperbasket dustbin can
        bin basket shiny thing shinything
    );
    AsTake qw(search find sift);

    Look q(
        It's a bunch of SOOT left over from the TRASHCAN you lit on fire.
    );

    Take q(
        You rummage around in the SOOT, looking for that elusive SHINY THING
        you saw before.  Eventually, your fingers grasp the metal thing and you
        triumphantly pull it towards you: It's a small metal KEY!
    );
    Take q(
        You already found the KEY, no need to get your hands any dirtier than
        they are.
    );

    Use q(
        None of your magic requires SOOT as a spell component. It's really
        quite useless.
    );

    OnceTake q{
        ^restroomkey ^ash

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
            adv.print(q(
                You use your ${wipe.name} to clean the ASH off of it, making it
                shiny again. You will always remember the ${wipe.name}$gen
                sacrifice.
            ));
        }
        else {
            adv.print(q(
                You dust the ASH off of it, making it shiny again.
            ));
        }
    };
};


Thing ash => sub {
    Inv 'ASH stuck all over everything';
    Alias qw(ashes);

    Look q(
        It's some ASH you somehow got in your INVENTORY when you picked up that
        shiny KEY of yours. And now it's just sticking over everything and you
        can't get rid of it all.
    );

    WithAny q(
        Stop getting that ASH all over everything.
    );
};


Thing restroomkey => sub {
    Inv 'a small, shiny KEY';
    Alias qw(key smallkey smallshinykey shinykey);

    Look q(
        You and this small, shiny KEY have had quite the adventure together.
        You went through fire and flames for each other.

        Well, at least one of you did, the other just got naked and dunked
        things in a TOILET for a while.
    );

    Take q(
        After what you went through, you'll take this KEY to the end of the
        world! Or at least until you USE it on something and it disappears from
        your INVENTORY.
    );

    Use q(
        You triumphantly take out the KEY, only to realize that you have to USE
        it WITH something else for this to make sense. Man, do you feel silly
        now.
    );

    With restroomdoor => q(
        You put your KEY into the DOOR - it fits! You swing it aside and
        gleefully stride through.
    );

    OnCombine restroomdoor => q{
        ~restroomkey -restroomdoor +temple
        ^temple ^cafeteria ^souvenierShop
        adv.setRoom("temple");
    };
};
