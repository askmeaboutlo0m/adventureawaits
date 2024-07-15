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


Thing table => sub {
    AsClimb qw(stand);

    Look qq(
        It's a cheap, round TABLE made of plastic. The surface has one of those
        gray patterns that makes it look perpetually dirty, the construction of
        the legs is less than stellar,
    );

    AmendLook q{
        if (adv.room.has(Thing.chewingGum)) {
            return q(
                $msg and actually you're getting so bored of looking at this
                thing that even the CHEWING GUM underneath it seems to be a
                more interesting topic.
            );
        }
        return q(
            $msg and actually you're getting incredibly bored of looking at
            this thing.
        );
    };

    Take q(
        This TABLE isn't hip enough to be part of your collection of furniture.
    );

    Use q(
        While you do feel a strange inner bond with this TABLE, you know in
        your heart that both of you are completely useless.
    );

    Smell q(
        Ew, it smells like a decade's worth of drinks spilled in unison and
        never cleaned up.
    );

    Climb q(
        It doesn't look like it would support your weight.
    );

    WithAny q(
        You don't want to put anything on this TABLE, it looks like it hasn't
        been wiped down in the last century or so.
    );
};


Thing chewingGum => sub {
    Alias qw(bubblegum gum wad);
    AsUse qw(eat chew);

    Look q(
        It's a pink wad of dry CHEWING GUM, firmly stuck to the underside of
        the TABLE.
    );

    Smell q(Mmh, fruit punch!);

    Use q(
        You can't chew it off the surface, your mouth doesn't work that way.
        Pick it up first.
    );

    Take q(
        You desparately scratch at the CHEWING GUM with your fingernails, but
        it's too firmly stuck to the surface to pull it of that way.
    );
    Take q(
        You still can't pull it off with your bare hands.
    );

    WithAny q(
        You can't scrape off the CHEWING GUM with that. Maybe if you'd ever
        worked a real job in your life, you'd already know that.
    );

    With blade => q(
        You painstakingly scrape off the CHEWING GUM from underneath the table.
        It takes you 45 minutes to do it, and you curse the culprit who stuck
        it under here. The BLADE has become even more incredibly dull, so you
        just throw it away angrily.
    );
    OnCombine blade => '-chewingGum ~blade ^hardGum';
};

Thing hardGum => sub {
    Inv q(an old, hard wad of CHEWING GUM);
    Alias qw(chewinggum bubblegum gum wad hardchewinggum);
    AsEat qw(use take chew);

    Look q(
        It's old, it's hard, it's CHEWING GUM.
    );

    Eat q(
        You pop the hard wad of CHEWING GUM into your mouth. Surprisingly, it
        turns back to something chewy very quickly, and even still has a nice
        fruit punch flavor to it.
    );
    OnEat '~hardGum ^softGum';

    Smell q(Mmh, fruit punch!);

    WithAny q(
        A hard wad of CHEWING GUM won't do any good there.
    );
};

Thing softGum => sub {
    Inv q(the soft CHEWING GUM that you're chewing);
    Alias qw(chewinggum bubblegum gum wad softchewinggum);
    AsEat qw(use take chew);

    Look q(
        You take it out of your mouth to take a look at the CHEWING GUM. It's
        soft, chewy and pink. You put it back into your mouth.
    );
    Look q(
        You don't need another look at it, it's just CHEWING GUM.
    );

    Eat q(
        You're already chewing it. Probably best to keep it in your mouth,
        since you wouldn't want it to stick up your inventory.
    );

    Smell q(
        You can taste it, it's fruit punch flavor. It probably smells of that
        too.
    );

    WithAny q(
        You don't want to stick any CHEWING GUM on that.
    );
};


Thing vendingMachine => sub {
    Alias qw(machine vendor slot funnel display);
    AsUse qw(take shake);

    Look q(
        It's one of those weird cult edition VENDING MACHINEs. Instead of a
        coin slot, there is a funnel and the display above it reads "INSERT
        SYMBOL OF ETERNAL YOUTH". Inside of the machine, there is a single,
        lonely bag of original flavor BEEF JERKY.
    );

    Use q(
        You shake the VENDING MACHINE, trying to get something out of it
        without paying. It doesn't work, you freeloader.
    );

    Talk q[
        A hollow voice from inside the VENDING MACHINE asks "why are you trying
        to talk to a vending machine". You don't respond, as a) the question
        was clearly rhetorical and b) you don't really know the answer
        yourself.
    ];

    With ash => q(
        You scratch together a handful of ASH from all over your INVENTORY and
        pour it into the funnel. The machine rattles and a hollow voice from
        inside says "weird how he's still ten after all these years, isn't it."

        It then spits out the last bag of BEEF JERKY, which you take.
    );

    With self => q(
        You don't fit into the VENDING MACHINE. Nor do any of your extremities.
    );

    With hands => q(
        Your arms don't fit into the VENDING MACHINE. Just pay it like a normal
        person would.
    );

    WithAny q(
        Trying to stick that into the VENDING MACHINE only yields you an
        annoying buzzing sound and the display reads "INVALID CURRENCY".
        Apparently it really does only take symbols of eternal youth.
    );
    WithAny q(
        The VENDING MACHINE only takes symbols of eternal youth.
    );

    OnCombine ash => q{
        -vendingMachine -_jerkyInMachine ~ash
        +_emptyMachine ^jerky
    };
};


Thing _emptyMachine => sub {
    Alias qw(vendingmachine machine vendor);
    AsLook qw(use);

    Look q(
        The VENDING MACHINE is empty now and the display just reads "SOLD OUT".
    );

    WithAny q(
        You'd rather not stick anything else in there, these things don't give
        change.
    );
};


Thing _jerkyInMachine => sub {
    Alias qw(jerky beefjerky beef bag);
    AsTake qw(buy);

    Look q(
        It's a lonely bag of original flavor BEEF JERKY. From the looks of it,
        it's the last of its kind. Who knows how long it's been in there.
    );

    Take q(
        You need to pay the VENDING MACHINE to get the BEEF JERKY.
    );

    WithAny q(
        You need to get it out of the VENDING MACHINE to do anything to it.
    );
};


Thing jerky => sub {
    Inv q(a bag of original flavor BEEF JERKY);
    Alias qw(beefjerky beef bag);
    AsUse qw(eat open rip);

    Look q(
        It's a packet of original flavor BEEF JERKY. Who knows how long it had
        been in that machine.
    );

    Use q(
        You rip open the packet to get at your well-earned BEEF JERKY. But
        apparently the stuff inside is older than expected, as all the meat
        just crumbles to dust as soon as the air touches it.

        But hey, at least you can chew on the SILICA GEL PACKET.
    );

    Smell q(
        It's a sealed plastic bag, so you don't SMELL anything.
    );

    OnUse '~jerky ^silicaGelPacket';
};


Replace desiccant => qw(dessicant dessiccant desicant);
Replace silica    => qw(silicon silicone);

Thing silicaGelPacket => sub {
    Inv q(a SILICA GEL PACKET);
    Alias qw(
        silica packet gel silicagel silicapacket gelpacket desiccant
        dessiccantpacket dessiccantgel
    );
    AsSmell q(lick chew);

    Look q(
        It's a SILICA GEL PACKET. One of those inedible little plastic squares
        that keep the moisture out of food. If you like big words with strange
        double letters, you may also call it a desiccant.
    );

    Use q(
        You need something to draw the moisture out of.
    );

    Smell q(
        Mmh, a hint of processed meat, smoke flavoring and salt.
    );

    Eat q(
        You better not! It would draw all the moisture from your body in an
        instant, leaving you as nothing but a dried-up pile of carbon.
    );

    With self => q(
        You wipe your brow with the SILICA GEL PACKET. It does a good job at
        drawing away the sweat, leaving your forehead nice and dry.
    );
    With self => q(
        You're already dry enough. You'll have to find something else to draw
        the moisture out of.
    );

    With toilet => q(
        It'd be pretty pointless to draw the water out of the TOILET, it would
        just refill with more water from the tank.
    );

    With wetFlute => q(
        The SILICA GEL PACKET doesn't fit into the hole of the flute. But you
        could just use it with the rest of your WEEDS instead.
    );

    With wetWeeds => q(
        You squish the SILICA GEL PACKET into your wad of wet WEEDS. It
        immediately sacrifices itself to soak up all the excess water from it.
        Now you have a stash of dry, green WEEDS, with all the chemicals and
        none of the wetness.
    );

    WithAny q(
        That doesn't need the moisture drawn out of it.
    );

    OnCombine wetWeeds => '~silicaGelPacket ~wetWeeds ^greenWeeds';
};
