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


Thing dragon => sub {
    Alias qw(
        drake wyrm monster creature boss fred glasses paw claw paws claws tail
        maw mouth teeth eyes nostrils nose smoke friend friends
    );
    AsTake qw(attack kill murder fight hit wrestle);
    AsTalk qw(greet hello hi sup ask encourage make flirt befriend);
    AsClimb qw(ride tame use);
    AsUse qw(hug kiss yiff touch take get pick);

    Look q(
        It's a fiersome DRAGON! Its long, spiked tail twitches restlessly, its
        man-sized claws scrape the ground underneath and smoke is rising from
        its flaring nostrils. Which is fogging up the little, square glasses
        sitting on its nose.
    );
    Look q(
        The large DRAGON stares back at you, looking determined and fearless.
        Its fingers are fiddling with his badly-tied tie, while his other hand
        firmly grips a greeting card in its DRESS SHIRT pocket for reassurance.
    );
    Look q(
        It's getting kinda awkward to have you stare at the DRAGON so much. It
        shakily opens his mouth to say something, but then chokes on its own
        smoke and enters a coughing fit.
    );
    Look q(
        The DRAGON has recovered from its coughing and is looking embarrassed.
        Its breath has gotten quick and it seems to be sweating nervously. The
        situation is getting dangerously uncomfortable.
    );
    Look q(
        The poor little DRAGON just looks around the room, evading your stare.
    );

    Use q(
        You're not that close with this DRAGON.
    );

    OnLook q{
        if (adv.userData.dragon == null) {
            adv.userData.dragon = 0;
        }
        if (adv.userData.dragon < 5) {
            adv.userData.dragon++;
        }
    };

    Take q(You try to fight the DRAGON once more.);

    OnTake q{
        adv.fightDragon();
    };

    PreTake q{
        if (!adv.userData.foughtDragon) {
            adv.print("With what? Your bare hands?");
            adv.userData.expectNextFight = true;
            return true;
        }
        return false;
    };

    Climb q(
        Inside a small, confined room is not a good place to ride a DRAGON.
    );

    Smell q(
        It smells of smoke and a little bit too much aftershave.
    );

    Eat q(
        This DRAGON looks really chubby, eating it would make your cholesterol
        levels go through the roof!
    );

    Talk q(
        You talk to the DRAGON, trying to calm it down. It takes a while to get
        a word out of it, but eventually you find out that its name is FRED and
        that he is very scared of adventurers. His mom really believes in him
        though and even got him a really nice motivational card.
    );
    Talk q(
        You encourage FRED about his fitness for the job. After all, even if
        he's really large and chubby, he does look fearsome at the first look.
        He blushes and thanks you for trying, but a real final boss probably
        wouldn't be chatting to the adventurer that's coming to vanquish them.
    );
    Talk q(
        You try to say something to FRED, but are interrupted by his stomach
        rumbling. He tells you that he was waiting for you to finally come in
        here, but it took you so long that it's way after his usual lunch time
        now. He got 20 dollars from his mom though, do you want to go and eat
        lunch with him?
    );
    Talk q(
        FRED is still hungry and offers to take you out to lunch again. Do you
        want to go with him?
    );

    OnTalk q(
        if (adv.userData.dragonTalk == null) {
            adv.userData.dragonTalk = 0;
        }
        if (adv.userData.dragonTalk == 2) {
            adv.userData.expectNextFriends = true;
        }
        else {
            adv.userData.dragonTalk++;
        }
    );

    PreTalk q(
        if (adv.userData.dragon == null) {
            adv.print(q(
                That DRAGON looks way too fierce and scary to talk to!
            ));
            return true;
        }
        else if (adv.userData.dragon == 1) {
            adv.print(q(
                The DRAGON looks pretty fierce, you are scared to talk to it.
            ));
            return true;
        }
        else if (adv.userData.dragon == 2) {
            adv.print(q(
                The DRAGON still looks a little bit too fierce for
                conversation.
            ));
            return true;
        }
        return false;
    );

    With hands => q(If you insist...);
    With hands => q(You try to fight the DRAGON once more.);

    OnCombine hands => q{
        adv.fightDragon();
    };

    With self => q(
        You offer YOURSELF as a sacrifice. The DRAGON asks you to please not
        make this weird.
    );
    With self => q(
        You've been asked to not make it weird, so stop doing that now.
    );

    WithAny q(
        That won't help you against the DRAGON.
    );
};


Thing dressShirt => sub {
    Alias qw(shirt dress suit tie greeting card greetingcard);

    Look q(
        The DRAGON is wearing a DRESS SHIRT that seems to be a bit too small
        for its chubby stature. Around its neck hangs a tie that looks like
        it's been tied by someone who'd never done it before. In the shirt
        pocket you can spot a greeting card depicting a cartoon bunny rabbit
        wishing the greetee all the best for a new job.
    );

    OnceLook q{
    };

    PreLook q{
        if (adv.userData.lookedAtShirt == null) {
            adv.userData.lookedAtShirt = true;
            return false;
        }
        adv.interact("look", "dragon");
        return true;
    };

    Take q(
        It's way too big for you. Besides, you'd probably just ruin it like you
        did your own clothes.
    );
};


Message fightDragon1 => q(
    With a mighty leap, you jump up and grab the DRAGON's snout. It looks at
    you in surprise as you ball your hand into a fist and strike right between
    its eyes, leaving a nasty bruise and smashing its glasses. You handily land
    back on the ground, while the DRAGON reels and lands on its backside. It
    starts sobbing and begs you to not hurt it anymore.  It can't see anything
    without its GLASSES, which lay broken on the floor.
);

Message fightDragon2 => q(
    Amazing, you vanquished the DRAGON with your bare hands! While it's still
    just sitting there, crying and shivering, you search through its
    belongings. Its wallet only contains reward cards from supermarkets and
    family restaurants, but the GREETING CARD in its shirt pocket has TWENTY
    DOLLARS in it! You take it and yell "now be gone, fatso!" With a miserable
    howl, the DRAGON rolls to its feet, wobbles up the STAIRS and runs into the
    wilderness.
);


Message befriendDragon1 => q(
    FRED is very happy about that, he was starving. He invites you to ride on
    his back. He turns towards the exit and puts his tail in front of you to
    climb aboard.
);

Message befriendDragon2 => q(
    You get up on FRED's back and he flies out of the exit of the cave. You two
    soar high above the clouds under the afternoon sun, while FRED clutches the
    greeting card from his mom with the twenty dollars of lunch money inside.
    The people at the drive-through stare in awe at the large dragon coming
    through, humming a cheerful tune to himself, and even more at how many milk
    shakes he gets for you two.
);

Message befriendDragon3 => q(
    After lunch, FRED and you are way too full to go back and have a boss fight
    together. So you agree to just postpone that indefinitely and go home
    instead, to get some more comfortable (or in your case, any at all) clothes
    on. FRED thinks that milkshakes and a nap are a much nicer end to an
    adventure than beating someone up anyway, and you can't disagree with that.
);


Thing brokenGlasses => sub {
    Alias qw(glasses glass);
    AsTake q(use);

    Look q(
        It's the little pair of GLASSES that the DRAGON had on its nose. Your
        punch shattered and bent it up beyond repair.
    );
    Look q(
        You know, the DRAGON is now wandering through the wilderness all alone,
        without being able to see anything. Oh, but I'm sure you did what you
        had to do, self defense and all that.
    );
    Look q(
        How about next time you blow up a light bulb I don't warn you and you
        can't see anything anymore. How would that feel?
    );
    Look q(
        Umm, I mean, it's just a pair of GLASSES that were broken when you...
        heroically vanquished the DRAGON.

        Please don't hurt me.
    );
    Look q(
        Broken GLASSES, a testament of your... heroic deeds.
    );

    Take q(
        You don't want these GLASSES, they're way uncool and also broken.
    );
};

Thing greetingCard => sub {
    Inv 'a GREETING CARD';
    Alias qw(card greeting);
    AsLook qw(read open);

    Look q(
        It's the GREETING CARD you took from the DRAGON as your spoils. It's
        got a cartoon bunny rabbit on the front wishing the reader all the best
        for a new job. On the inside, a hand-written message, encircled with a
        heart shape, reads "I'm so glad you finally got a job! I'm sure you'll
        do just fine keeping all those adventurers out. Love, mom."
    );
};

Thing twentyDollars => sub {
    Inv 'the TWENTY DOLLARS you took out of the card';
    Alias qw(twenty dollar dollars money twentybucks bucks bill bloodmoney);

    Look q(
        It's TWENTY DOLLARS you took out of the DRAGON's GREETING CARD as your
        spoils of combat. Which is totally okay, you did vanquish it after all.
    );
    Look q(
        No, it's fine, you took those TWENTY DOLLARS fair and square. It's not
        like the DRAGON's mother gave that to him as a present or anything.
    );
    Look q(
        You know, maybe we should call this item "blood money" instead.
    );
    Look q(
        Alright, alright! It's just a bill of TWENTY DOLLARS, please don't beat
        me up as well.
    );
    Look q(
        It's... just a regular TWENTY DOLLARS.
    );

    Use q(
        You'll surely buy something nice from this money. Clothes, for
        instance.
    );
};

Thing stairs => sub {
    Alias qw(door exit);
    AsGo qw(take use);

    Look q(
        It's the STAIRS leading out of this place, sunlight is streaming in.
        You hear scraps of sobbing and crying still wafting in from the outside
        every now and then.
    );

    Go q(
        Having heroically vanquished the DRAGON like a true adventurer, you
        proudly stride out of the EXIT. Clutching the TWENTY DOLLARS of lunch
        money in your bare hands of terror, you make your way to the nearest
        store to buy some new clothes and a sandwich or something. The GREETING
        CARD lies forgotten on the floor, since the DRAGON is sure to lose its
        job and its mother's support after being defeated so easily.

        You ascribe pit in your stomach to the feeling of accomplishment and
        glory.
    );

    OnGo q{
        adv.wait();
        adv.gameOver();
    };
};
