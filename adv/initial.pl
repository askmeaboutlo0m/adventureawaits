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


Thing self => sub {
    Inv 'YOURSELF';
    Alias qw(myself inventory);

    Go q(
        You close your eyes and go into yourself. You return to a calm and
        collected state. Then you wake up from your power nap.
    );
    Go q(
        You go into yourself again, but you're not exhausted enough to have
        another nap.
    );

    Take q(
        No one can take you away from me.
    );

    Use q(
        You're completely useless.
    );

    Eat q(
        Auto-cannibalism is not the answer.
    );

    Drink q(
        You're not liquid enough.
    );

    Smell q(
        You smell like yourself. I won't elaborate on that.
    );

    Stand q(
        You stand on your own foot. It hurts.
    );

    Talk q(
        Don't talk back to the voice in your head. It's just the narrator.
    );
};


Thing clothes => sub {
    Inv "the CLOTHES you're wearing";
    Alias qw(clothing shirt pants);
    AsTake q(drop rip tear pull);

    Look q(
        Well, they're your CLOTHES. Nothing fancy.  Not implying that you don't
        know how to dress properly, it just didn't fit the occasion. No one
        would expect you to wear something other than rags to a text adventure
        game.
    );

    Take q(
        Alright then. You take off your SHIRT and PANTS. Exposed to the raw
        elements, your underwear immediately disintegrates into a fine mist,
        leaving you naked.
    );

    WithAny q(
        Your CLOTHES are in use: you're wearing them.
    );

    OnTake '~clothes ^shirt ^pants';
};


Thing shirt => sub {
    Inv 'your SHIRT';
    Alias qw(TSHIRT);
    AsUse qw(wear put equip);

    Look q(
        It's one of those SHIRTs you get in a multi pack from the supermarket.
        The thin, gray, stringy fabric makes it look like some kind of cloth
        rather than something wearable.
    );

    Take q(
        You already took it off. And you're not gonna get to put it back on,
        you stay naked and think about the consequences of your actions.
    );

    Use q(
        You attempt to put your shirt back on, but you just can't manage to get
        the right extremities through the appropriate holes. Better leave it
        off for now.
    );

    With self => q(
        You put your PANTS on your head. But that looks silly, so you take them
        back off again.
    );

    WithAny q(
        Don't scatter your dirty laundry everywhere.
    );
};


Thing pants => sub {
    Inv 'your PANTS';
    Alias qw(pant trouser trousers shorts);
    AsUse qw(wear put equip);

    Look q(
        Well, PANTS might be stretching it. They're a pair of shorts. Basically
        a rag with two leg holes in it.
    );

    Take q(
        You won't achieve anything by taking off your pants just to put them
        back on later. Just look where it got you in real life.
    );

    Eat q(
        You think about eating your shorts, but you don't want to risk being
        sued for trademark violation.
    );

    Use q(
        You put your PANTS on your head. But that looks silly, so you take them
        back off again.
    );

    With self => q(
        You put your PANTS on your head. But that looks silly, so you take them
        back off again.
    );

    With shirt => q(
        Actually, now that you took them off, I guess it's alright to tell you:
        those two don't go together. Like, at all. I won't let you put them
        back on and have you embarrass yourself further.
    );

    WithAny q(
        That doesn't want to wear any PANTS.
    );
};


Thing hands => sub {
    Inv '';
    Alias qw(barehands barehand hand);
    AsTake qw(wield equip hold);
    AsUse qw(clap);

    Look q(
        They're your BARE HANDS, soft and gentle.
    );

    Use '';
    PreUse q{
        adv.act("clap");
        return true;
    };

    Take q(
        You wield your BARE HANDS (1 nonlethal poking damage, -2 confidence
        bonus to all attack and damage rolls).
    );

    With self => q(
        Stop touching yourself in front of me.
    );

    WithAny q(
        Get your grubby hands off of that.
    );
};


Thing room => sub {
    Inv '';

    Look q(It's a room.);

    PreLook q(
        adv.act("look");
        return true;
    );

    Go q(
        You're already there.
    );
};

Thing floor => sub {
    Inv '';
    Alias qw(floors ground earth);
    AsStand qw(use);

    Look q(
        Well, it sure is a FLOOR. And you're standing on it.
    );

    Stand q(
        You're standing on it already.
    );

    WithAny q(
        You don't want to throw that on the FLOOR.
    );
};

Thing ceiling => sub {
    Inv '';
    Alias qw(roof);

    Look q(
        It's a fascinating CEILING.
    );

    Stand q(
        Your current gravity situation does not allow for it.
    );

    WithAny q(
        You don't want to smash that into the CEILING.
    );
};

Thing wall => sub {
    Inv '';
    Alias qw(walls tile tiles);

    Look q(
        The WALL is exceedingly vertical.
    );

    Stand q(
        The WALL's verticality prevents you from doing that.
    );

    WithAny q(
        You don't feel like decorating the WALL with that.
    );
};


Thing narrator => sub {
    Inv '';
    Alias qw(narator storyteller voice);
    AsTake qw(lick poke touch reach climb);

    Look q(
        You don't see me, you can only hear my voice in your head.
    );

    Use q(
        Don't try anything funny, I could narrate you out of existence!
    );

    Take q(
        You can't reach me.
    );

    Go q(
        Maybe you can be the narrator in some other game, if you manage get out
        of this one.
    );

    Eat q(
        No, you need to watch your sodium intake.
    );

    Drink q(
        I'm not liquid enough.
    );

    Smell q(
        I smell omnicient.
    );

    Talk q(
        Don't talk back to me, just do as I say.
    );

    WithAny q(
        Stop using game objects on me, they leave stains.
    );
};
