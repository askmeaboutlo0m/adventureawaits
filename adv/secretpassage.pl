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


Thing exitDoor => sub {
    Alias qw(exit door);
    AsUse qw(open go);

    Look q(
        It's a large, wooden DOOR with a glowing "exit" sign above it. It
        doesn't have a handle though, instead it seems to be operated by that
        LEVER next to it.
    );

    Use q(
        How? This DOOR doesn't have a handle that you could open it with.
    );

    WithAny q(
        You should just try pulling the LEVER instead of shoving that into the
        door.
    );
};


Thing lever => sub {
    Alias qw(switch handle stick arm crank);
    AsUse qw(pull push yank tug switch crank);

    Look q(
        It's a big LEVER connected to the mechanism of PIPES that operate the
        DOOR.
    );

    Use q(
        With some effort, you pull down the squeaking LEVER. A bubbling and
        rumbling echoes from deep within the machinery, and steam begins to
        hiss out from vents here and there.
    );
    Use q(
        You pull the LEVER again.
    );

    AmendUse q{
        if (adv.room.has(Thing._holePipes)) {
            return q(
                $msg However, instead of setting anything interesting in
                motion, the steam just escapes from the big hole in the PIPES.
                The LEVER returns to its original position, having accomplished
                nothing.
            );
        }
        else if (adv.room.has(Thing._gumPipes)) {
            return q(
                $msg Since your CHEWING GUM only covers the rim, the steam just
                escapes from the hole in the PIPES, preventing the mechanism
                from working properly. The LEVER resets itself to its original
                position.
            );
        }
        else if (adv.room.has(Thing._nailPipes)) {
            return q(
                $msg Since your NAIL doesn't sit air-tight, the steam just
                escapes from the hole in the PIPES, preventing the mechanism
                from working properly. The LEVER resets itself to its original
                position.
            );
        }
        else {
            return q(
                $msg Your patch, literally made of rusted NAIL and CHEWING GUM,
                wobbles and strains precariously as the steam flows through the
                PIPES underneath it. Given your previous experiences with game
                objects spectacularly destroying themselves, you duck and
                cover.\n\nTo your surprise however, the patch holds and the
                DOOR slowly grinds open! You squeeze through it and it slams
                shut behind you.
            );
        }
    };

    OnUse q{
        if (adv.room.has(Thing._fixedPipes)) {
            ~restroom ~temple ~cafeteria ~souvenierShop ~secretPassage
            >bossRoom
        }
    };
};


my %pipes = (
    _holePipes => {
        alias => [],
        look  => q(
            There's even a hole in one of the PIPES, about as big around as
            your wrist.
        ),
    },
    _gumPipes => {
        alias => [qw(softgum chewinggum bubblegum gum wad softchewinggum)],
        look  => q(
            You put some CHEWING GUM around the rim of the hole in the PIPES,
            but it doesn't come close to covering it.
        ),
    },
    _nailPipes => {
        alias => [qw(nail tack pin)],
        look  => q(
            You stuck your rusty NAIL into the hole in the PIPES, but it's
            nowhere near airtight.
        ),
    },
    _fixedPipes => {
        alias => [qw(
            softgum chewinggum bubblegum gum wad softchewinggum nail tack pin
        )],
        look  => q(
            You made a makeshift patch for the hole in the PIPES from a rusty
            NAIL and some CHEWING GUM.
        ),
    },
);

for my $key (sort keys %pipes) {
    my %pipe = %{ $pipes{$key} };
    Thing $key => sub {
        Alias (
            qw(pipe pipes hole hydraulicpipe hydraulicpipes hydraulic),
            qw(hydraulics mechanism), @{ $pipe{alias} },
        );
        AsUse qw(block fix hold shut close);
        AsTake qw(remove);

        Look qq(
            It's an intricate hydraulic network connected to the DOOR. Once upon a
            time it was probably a pretty sweet mechanism, but now it's all rusted
            up. $pipe{look}
        );

        Use q(
            You can't just hold it with your bare hands, the steam would scald
            your skin. And you're really in enough chronic pain already.
        );

        Take q(
            No, it's good where it's at.
        );

        for my $flute (qw(flute yellowFlute wetFlute greenFlute
                          litYellowFlute litGreenFlute)) {
            With $flute => q(
                Trying to patch up a hole with a holey FLUTE will never work.
            );
        }

        for my $weeds (qw(yellowWeeds wetWeeds greenWeeds)) {
            With $weeds => q(
                You try to stuff your WEEDS into the hole, but it's too fiddly
                and you just end up throwing some of it down the PIPES.
            );
        }

        With hardGum => q(
            The CHEWING GUM is rock hard, it's useless as a patch.
        );

        WithAny q(
            That won't help you fix the PIPES.
        );
    };
}

Stuff _holePipes => sub {
    With softGum => q(
        You take your CHEWING GUM out of your mouth and try to cover the hole
        in the PIPES with it. However, you don't nearly have enough, so you
        basically just covered the rim with it.
    );

    OnCombine softGum => '~softGum -_holePipes +_gumPipes';

    With nail => q(
        You stick your rusty NAIL into the hole in the PIPES. It fits pretty
        well, but it doesn't seal it well. There's little gaps and cracks where
        the steam can still escape.
    );

    OnCombine nail => '~nail -_holePipes +_nailPipes';

    With plug => q(
        You stick your makeshift PLUG into the hole in the PIPES. It seems to
        make an alright seal, if you completely disregard the safety of the
        large hydraulic mechanism.
    );

    OnCombine plug => '~plug -_holePipes +_fixedPipes';
};

Stuff _gumPipes => sub {
    With nail => q(
        You stick your rusty NAIL into the hole in the PIPES. It fits pretty
        well, and the CHEWING GUM makes an alright seal, if you completely
        disregard the safety of the large hydraulic mechanism.
    );

    OnCombine nail => '~nail -_gumPipes +_fixedPipes';
};

Stuff _nailPipes => sub {
    With softGum => q(
        You take your CHEWING GUM out of your mouth and stick it around the
        edge of the rusty NAIL. It makes an alright seal around the hole in the
        PIPES, if you completely disregard the safety of the large hydraulic
        mechanism.
    );

    OnCombine softGum => '~softGum -_nailPipes +_fixedPipes';
};
