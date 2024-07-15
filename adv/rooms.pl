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


my %rooms = (
    restroom => {
        alias => [qw(bathroom washroom toilet)],
        go    => q(Okay, you're back in the RESTROOM.),
    },
    temple => {
        alias => [qw(tempel church chapel door exit)],
        go    => q(You return to the TEMPLE.),
    },
    cafeteria => {
        alias => [qw(vendeteria cafe)],
        go    => q(You visit the CAFETERIA.),
    },
    souvenierShop => {
        alias => [qw(shop suveniershop souvenirshop souveneirshop suvenirshop store)],
        go    => q(You enter the unattended SOUVENIER SHOP.),
    },
    secretPassage => {
        alias => [qw(passage secret secretpass pass stair stairs)],
        go    => q(You make your way down the stairs of the SECRET PASSAGE.),
    },
    bossRoom => {
        alias => [],
        go    => q(You somehow re-enter the BOSS ROOM.),
    },
);


for my $key (sort keys %rooms) {
    my %r = %{ $rooms{$key} };

    Thing $key => sub {
        Inv '';
        Alias @{ $r{alias} };
        AsGo qw(use take);

        Look q(
            If you want to take a look at that room, you should probably
            just GO there.
        );

        PreLook qq(
            if (adv.room == adv.rooms["$key"]) {
                adv.act("look");
                return true;
            }
            return false;
        );

        Go $r{go};
        OnGo ">$key";

        PreGo qq(
            if (adv.room == adv.rooms["$key"]) {
                adv.print("You're already there.");
                return true;
            }
            return false;
        );
    };
}
