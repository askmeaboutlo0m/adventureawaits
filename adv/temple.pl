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


Thing altar => sub {
    Alias qw(alter);
    AsUse qw(lay sleep sit climb);
    AsTake qw(move push drag pull shove open);

    Look q(
        A smooth stone ALTAR is the center piece of this TEMPLE. It's queen
        size, but the surface is full of burn marks and doesn't look
        comfortable.
    );

    AmendLook q{
        if (adv.room.has(Thing.secretPassage)) {
            msg = q(
                $msg You moved it out of the way to reveal a SECRET PASSAGE
                underneath.
            );
        }
        else {
            msg = q(
                $msg The floor behind it is scratched up really badly,
                suggesting that this thing has been moved around at some point.
            );
        }

        if (adv.room.has(Thing.yellowWeeds)) {
            msg = q(
                $msg Some WEEDS have sprouted up through the stone at the foot
                of the ALTAR long ago, but they're all dried up and yellow now.
            );
        }

        return msg;
    };

    Use q(
        You'd rather not make sacrifices to unknown causes. Not after what
        happened the last time you laid naked on a stone slab.
    );

    Take q(
        With your new-found strength, you stem yourself against the ALTAR. Inch
        by inch, you manage to push it back far enough to reveal a SECRET
        PASSAGE! You let out a scream of victory, hoping that you can convince
        yourself that this was worth all the pain and suffering.
    );
    Take q(
        You put enough effort into moving it once already.
    );

    PreTake q(
        if (!adv.userData.strong) {
            adv.print(q(
                With all your might, you try to move the ALTAR. After minutes
                of pushing however, you have to come to terms with just being
                too weak.
            ));
            return true;
        }
        return false;
    );

    OnceTake '+secretPassage ^secretPassage';
};


Thing statue => sub {
    Alias qw(bard bardstatue);

    Look q(
        It's a life-sized STATUE made from dark marble. It depicts some kind of
        bard with frilly clothing a rather dopey expression.
    );

    AmendLook q{
        if (adv.room.has(Thing.flute)) {
            return q($msg In its hands is a strange, bulbous FLUTE.);
        }
        else {
            return q($msg There's nothing in its hands anymore.);
        }
    };

    Take q(
        If this STATUE were alive, you might TAKE it with you. But until you
        learn that animate object spell, that's not gonna happen.
    );

    Use q(
        You have no USE for this STATUE, it would go terribly with the rest of
        your interior decoration.
    );

    Go q(
        You GO full BARD, dancing around and singing at the top of your lungs.
        But it gets exhausting quickly, so you stop doing that.
    );
    Go q(
        No, you've realized that the BARD life isn't for you.
    );
};


Thing painting => sub {
    Alias qw(picture image);
    AsLook qw(appreciate);
    AsTake qw(pull);
    AsGo qw(jump leap);

    Look q(
        This is a 20 ft tall PAINTING depicting a handful of people sitting
        around a campfire, puffing smoke from their pipes.
    );
    AmendLook q{
        if (adv.room.has(Thing._nailInWall)) {
            return q(
                $msg Way at the top of it you spot that it's held by a single,
                large NAIL.
            );
        }
        else {
            return q(
                $msg Since you pulled out the NAIL, the PAINTING is just
                sitting on the ground, leaning against the wall.
            );
        }
    };

    Take q(
        This thing is way too heavy to drag around with you.
    );

    Use q(
        You know, normal people use art by LOOKing at it.
    );

    Smell q(
        It smells unpleasantly like dry paint and smoke. Probably because it's
        meant to be LOOKed at, not smelled.
    );

    Climb q(
        There's nothing you could hold onto to do that.
    );

    Go q(
        You try to jump into the painting, expecting it to take you to stage 1.
        It doesn't work though, you just hit your head and fall to the floor.
    );
    Go q(
        Your last interaction has disillusioned you enough already.
    );

    WithAny q(
        Don't ruin the nice PAINTING with that.
    );
};


Thing _nailInWall => sub {
    Alias qw(nail tack pin);
    AsTake qw(use reach pull);

    Look q(
        It's a big old NAIL, about the size of your hand. It's stuck way high
        up on the wall and holding up the PAINTING.
    );

    Take q(
        You pull the NAIL out of the wall with relative ease. The PAINTING
        falls to the ground with a thump.
    );

    OnTake '-_nailInWall ^nail';

    PreTake q{
        if (!adv.scene.tripping) {
            adv.print("You can't reach it, it's way too high up.");
            return true;
        }
        return false;
    };

    WithAny q(
        That won't help you reach the NAIL.
    );
};

Thing nail => sub {
    Inv 'a large NAIL';
    Alias qw(tack pin);
    AsEat qw(chew bite);

    Look q(
        It's a large rusty NAIL, about the size of your hand.
    );

    Take '.got';

    Use q(
        On its own, a NAIL is not much use.
    );

    Smell q(
        Notes of rust and drywall.
    );

    Eat q(
        Quit chewing your NAILs.
    );

    With softGum => q(
        You take the CHEWING GUM out of your mouth and wrap it around the rusty
        NAIL. The result is a makeshift PLUG, or at least you tell yourself
        that so that it doesn't seem weird why you're just sticking random
        objects together.
    );

    OnCombine softGum => '~nail ~softGum ^plug';

    WithAny q(
        That doesn't need to be NAILed.
    );
};

Thing plug => sub {
    Inv 'a makeshift PLUG';
    Alias qw(nail tack pin softgum chewinggum bubblegum gum wad softchewinggum);
    AsUse qw(plug);
    AsEat qw(chew bite);

    Look q(
        It's the best (and only) PLUG you've ever made. But it's actually just
        a rusty NAIL with some CHEWING GUM wrapped around it.
    );

    Use q(
        You need to find something to PLUG if you want to use this thing.
    );

    Smell q(
        It smells great actually, the fruit punch melds really well with the
        notes of rust and drywall.
    );

    Eat q(
        You're not sure when if your tetanus shots are still good, so you
        resist sticking the PLUG in your mouth.
    );

    WithAny q(
        That doesn't need to be PLUGged.
    );
};


my %flutes = (
    flute => {
        inv    => 'a bulbous FLUTE',
        look   => '',
        use    => q(
            You blow into the FLUTE, but it doesn't make any noise. It does,
            however, make your mouth taste strangely herb-like.
        ),
        sparks => q(
            You stick the FLUTE into the SPARKS. It achieves absolutely
            nothing.
        ),
    },
    yellowFlute => {
        inv    => 'a FLUTE stuffed with dried yellow WEEDS',
        look   => 'You stuffed a bunch of dried, yellow WEEDS into it.',
        use    => q(
            You suck on the FLUTE. It makes your mouth taste stale, but nothing
            else. Probably because it's not lit.
        ),
        sparks => q(
            You stick the FLUTE into the SPARKS. The WEEDS get lit up and start
            smoldering, creating smoke and the smell of burning leaves.
        ),
        light  => 'litYellowFlute',
    },
    wetFlute => {
        inv    => 'a FLUTE stuffed with wet, green WEEDS',
        look   => 'You stuffed some wet, green WEEDS into it',
        use    => q(
            You try to suck on the FLUTE, but the wet WEEDS have clogged it up
            completely.
        ),
        sparks => q(
            You stick the FLUTE into the SPARKS, but the WEEDS inside it are so
            wet that it just causes fizzling noises.
        ),
    },
    greenFlute => {
        inv    => 'a FLUTE stuffed with dry, green WEEDS',
        look   => 'You stuffed some dry, green WEEDS into it',
        use    => q(
            You suck on the FLUTE. It makes your mouth taste very herb-like,
            but nothing more. Probably because it's not lit.
        ),
        sparks => q(
            You stick the FLUTE into the SPARKS. The WEEDS get lit up and start
            smoldering.
        ),
        light  => 'litGreenFlute',
    },
    litYellowFlute => {
        inv    => 'a FLUTE stuffed with smoldering yellow WEEDS',
        look   => q(
            The yellow WEEDS inside it are smoldering and smoking. The burning
            smell is making your head hurt.
        ),
        use    => q(
            You smoke the FLUTE. It tastes terrible and gives you a headache,
            but nothing else. Probably because these are just WEEDS, not green.
        ),
        sparks => "It's already lit.",
        smoke  => '~litYellowFlute ^flute',
    },
    litGreenFlute => {
        inv    => 'a flute stuffed with smoldering green WEEDS',
        look   => q(
            The green WEEDS inside are smoldering and smoking. The chemical
            smell is making you feel light-headed.
        ),
        use    => q(
            You smoke the WEEDS. It's a strange chemical taste, but oddly
            pleasant regardless. The chemicals are rapidly getting to your head
            and the room begins to spin around you.
        ),
        sparks => "It's already lit.",
        smoke  => q{
            ~litGreenFlute ~greenWeeds
            adv.scene.trip = true;
            adv.scene.wait();
            adv.print("Whoah.");
        },
    },
);

my %weeds = (
    yellowWeeds => {
        quantity => 'a bunch of',
        describe => 'dry, yellow WEEDS',
        flute    => 'almost appropriate somehow',
        toilet   => q(
            You dunk the yellow WEEDS into the blue, perfumy water of the
            TOILET. When you pull them out, the chemicals have turned them
            bright green. They're also very wet now.
        ),
        look     => q(
            Whatever green they had has withered long ago and now they're just
            yellow.
        ),
        sparks   => q(
            You throw some of your dry, yellow WEEDS into the SPARKS. They
            catch on fire and leave the unpleasant smell of burning leaves.
        ),
    },
    wetWeeds => {
        quantity => 'a wad of',
        describe => 'wet, green WEEDS',
        flute    => 'appropriate, but the wetness is just wrong',
        toilet   => "They've been in there enough.",
        look     => q(
            It smells strongly of chemicals, it almost makes your head spin.
        ),
        sparks   => q(
            You throw some of your wet, green WEEDS into the SPARKS. Nothing
            much happens other than the SPARKS fizzling out as they touch the
            wet mass.
        ),
    },
    greenWeeds => {
        quantity => 'a stash of',
        describe => 'dry, green WEEDS',
        flute    => 'very appropriate',
        toilet   => "They've been in there enough.",
        look     => q(
            You should probably get rid of it before you get arrested.
        ),
        sparks   => q(
            You throw some of your dry, green WEEDS into the SPARKS. They catch
            on fire and fill the room with a chemical smell that makes you feel
            a bit dizzy.
        ),
    },
);


for my $f (keys %flutes) {
    my %flute = %{$flutes{$f}};
    my ($kind) = $f =~ /^(.*)Flute$/;

    Stuff $f => sub {
        Inv $flute{inv};
        Alias qw(flute pipe bong);
        AsUse qw(blow play smoke draw);

        Look qq(
            It's an odd-looking, curved FLUTE with a bulbous end. It doesn't
            actually look like it'd make for good music, since there's no holes
            other than the one you blow into and the one air comes out.
            $flute{look}
        );

        Use $flute{use};
        OnUse $flute{smoke} if $flute{smoke};

        Eat q(
            You chew on the FLUTE. It tastes like dust and clay.
        );

        Smell q(
            It smells like herbs and smoke.
        );

        With toilet => q(
            Since you might still want to put your mouth on the FLUTE, you'd
            rather not stick it in the TOILET.
        );

        With statue => q(
            The FLUTE is of much more use to you than it is to this STATUE.
        );

        With painting => q(
            You sensually rub your FLUTE against the PAINTING. It's weird, but
            nothing else.
        );

        With sparks => $flute{sparks};

        if ($flute{light}) {
            OnCombine sparks => "~$f ^$flute{light}";
        }

        if ($kind) {
            AsTake qw(empty);
            Take 'You decide to take the WEEDS back out of the FLUTE.';
            OnTake "~$f ^flute";

            for my $w (keys %weeds) {
                if ($w =~ /$kind/) {
                    With $w => q(It's already full of that.);
                }
                else {
                    local $Adv::shush = 1;
                    PreCombine $w => qq{
                        adv.interact("take", "flute");
                        adv.print("");
                        adv.combine("combine", "flute", "weeds");
                        return true;
                    };
                }
            }
        }
    };
}


Thing yellowWeeds => sub {
    AsTake qw(pull);

    Take q(
        You decide to pull out the WEEDS around the ALTAR. They're so dried up
        that they come out very easily.
    );

    OnceTake '-yellowWeeds ^yellowWeeds';

    local $Adv::shush = 1;
    OnCombine toilet => '~yellowWeeds ^wetWeeds';
};


for my $w (keys %weeds) {
    my %weed = %{$weeds{$w}};

    Stuff $w => sub {
        Inv "$weed{quantity} $weed{describe}";
        Alias qw(weeds weed);
        AsUse qw(smoke);

        Look "It's $weed{quantity} $weed{describe}. $weed{look}";

        Take "You can't just TAKE WEEDS like that.";

        Use "You can't really do anything with WEEDS on their own.";

        Eat q(
            You're pretty sure that's not how you get a kick out of WEEDS.
        );

        With toilet => $weed{toilet};
        With sparks => $weed{sparks};

        With blade => q(You cut the WEEDS into smaller pieces.);

        AmendCombine blade => q{
            if (adv.userData.weedSize == null) {
                adv.userData.weedSize = 1.0;
            }
            var size = adv.userData.weedSize *= 2.0;
            return q(
                $msg They're now 1/$size-sized pieces.
            );
        };
    };
}


Stuff flute => sub {
    Take q(
        You grab the FLUTE the STATUE is holding and yank it out. It's
        surprisingly easy, as if it's meant to be detachable.
    );
    Take '.got';

    OnceTake '-flute ^flute';

    for my $w (keys %weeds) {
        my %weed = %{$weeds{$w}};
        my ($kind) = $w =~ /^(.*)Weeds$/;

        With $w => qq{
            You stuff a bit of your $weed{describe} into the bottom of
            the FLUTE. It looks $weed{flute}.
        };

        OnCombine $w => "~flute ^${kind}Flute";
    }

    PreCombine yellowWeeds => q{
        if (!adv.inv.has(Thing.flute)) {
            adv.interact("take", "flute");
            adv.print("");
        }
        if (!adv.inv.has(Thing.yellowWeeds)) {
            adv.interact("take", "weeds");
            adv.print("");
        }
        return false;
    };
};
