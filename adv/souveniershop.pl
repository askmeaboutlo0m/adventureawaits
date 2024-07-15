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


Message clapper1 => q(
    And the LAMP's bulb begins to glow! Although don't get to excited, the glow
    is extremely dim, the filament is barely red.
);

Message clapper2 => q(
    The LAMP begins to glow ever so slightly more. It's still really dim
    though.
);

Message clapper3 => q(
    The LAMP starts to glow properly bright now. And it keeps getting brighter
    until the bulb suddenly explodes in a mist of broken glass! As you open
    your eyes again, you see that most of the bulb has disintegrated and the
    filament has been exposed, which is now spraying SPARKS everywhere.
);

Message clapper4 => q(
    The LAMP doesn't react to you anymore and SPARKS are still happily flying
    from it. The explosion probably broke the sensor.
);


Thing clapper => sub {
    Alias qw(lamp light bulb lightbulb);

    Look q(
        It's some kind of desk lamp sitting on a podium, but it's just a bare
        stick, without any lampshade. A sign on the podium reads "The Clapper -
        With Three Intensity Settings".
    );

    Take q(
        It's firmly affixed to its podium, and even the bulb is glued in place.
    );

    Use q(
        It's featureless, there's no switch or anything.
    );

    AmendLook q{
        if (adv.userData.clapper == null) {
            return q(
                $msg It's turned off, and you don't see any switch or anything
                to turn it on.
            );
        }
        else if (adv.userData.clapper == 1) {
            return q(
                $msg The bulb is glowing extraordinarily dimly.
            );
        }
        else if (adv.userData.clapper == 2) {
            return q(
                $msg Even at its second intensity setting, the light is still
                very dim.
            );
        }
        else {
            return q(
                $msg The lightbulb has exploded into 69,105 tiny pieces and
                SPARKS are happily flying from the filament.
            );
        }
    };
};


Thing slapChop => sub {
    Alias qw(chopper slapchopper junk button);
    AsUse qw(slap hit whack press push);

    Look q(
        It's a small, cylindrical plastic contraption with a button on top that
        reads "slap me". A sign above it describes it as "The SLAP CHOP - Slap
        Your Food Cutting Troubles Away".
    );

    Take q(
        It's glued to the table. But actually, you don't want to chop small
        amounts of food via domestic violence anyway.
    );

    Use q(
        You slap the SLAP CHOP. The flimsy plastic shatters instantly and
        you're left with a BLADE sticking in the table.
    );
    OnUse q(
        -slapChop +_bladeInTable
    );

    WithAny q(
        You don't need to chop that. It probably wouldn't fit in the SLAP CHOP
        anyway.
    );
};


Thing _bladeInTable => sub {
    Alias qw(blade);
    AsTake qw(pull);

    Look q(
        It's the only thing that's left of the SLAP CHOP after you slapped it:
        a dull BLADE stuck in the table.
    );

    Take q(
        You pull the BLADE out of the table. It's so dull that you don't have
        to worry about it damaging anything else in your INVENTORY.
    );
    OnTake '-_bladeInTable ^blade';

    Use q(
        It's not much use being stuck in the table.
    );
};

Thing blade => sub {
    Inv q(a dull BLADE);
    AsTake qw(wield equip hold use);

    Look q(
        It's the BLADE out of the SLAP CHOP. It's very dull.
    );

    Take q(
        You wield the BLADE (1d4 nonlethal bludgeoning damage).
    );
    Take q(
        It's already equipped.
    );

    With self => q(
        You feel a crawling in your skin and slash your wrists with the BLADE.

        Oh wait no, it was just goosebumps. Good thing the BLADE is way too
        dull to cut through your skin.
    );
    With self => q(
        The BLADE is way too dull to even cut your skin.
    );

    With hands => '';
    PreCombine hands => q{
        adv.combine("combine", "blade", "self");
        return true;
    };

    WithAny q(
        The BLADE is way too dull to cut that.
    );
};


Thing sparks => sub {
    Alias qw(spark electricity);
    AsUse qw(touch take);

    Look q(
        There's SPARKS happily spraying from the exposed filament of the
        ex-lightbulb. They're leaving scorch marks over the podium and floor.
    );

    Use q(
        You stick your hand in the SPARKS and burn your fingers. You put them
        in your mouth to ease the pain and think to yourself that you should
        really quit doing stuff like this.
    );
    Use q(
        No, you burned your fingers on these enough.
    );

    Smell q(
        It smells like an electrical fire.
    );
};


Thing bowflex => sub {
    Alias qw(
        gym homegym homegymsystem gymsystem workoutequipment equipment weight
        weights bow flex system equip pulley pulleys machine bowflexrevolution
        workout bowflexrevolutionworkoutequipment
    );
    AsUse qw(lift pull yank tug);

    Look q(
        It's some overly complicated WORKOUT EQUIPMENT that's operated with a
        weird pulley system attached to some weights. The sign on it reads
        "BOWFLEX revolution home workout equipment - now with 20% less
        long-term damages!"
    );

    Use q(
        You sit yourself down in the BOWFLEX machine and start yanking the
        pulleys. The pulleys tug back, lock your arms in place and start to
        violently stretch your muscles into shape. You scream in agony.

        After 20 minutes, your workout routine and vocal chords are finished.
        While you will suffer immense chronic pain for the rest of your life,
        your arms feel significantly stronger now.
    );
    Use q(
        You've gotten enough muscles and anguish out of this thing.
    );

    OnUse q{
        adv.userData.strong = true;
    };

    Take q(
        Nah, you'd probably use it once or twice and then it would sit in the
        corner gathering dust. Just like your other workout equipment.
    );

    WithAny q(
        That doesn't need a workout.
    );
};
