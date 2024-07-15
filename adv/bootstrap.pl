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


Stopwords qw(a at and down in into of off on onto out over the to up with);

my @look = qw(check see investigate view inspect examine watch);
Act      look => @look;
Interact look => @look;

Act die       => qw(give quit exit);
Act cry       => qw(whine whimper bawl whinge);
Act help      => qw(halp hlp);
Act clap      => qw(applaud);
Act yes       => qw(yeah ye yup sure yea);
Act no        => qw(nope nah naw na);
Act apologize => qw(sorry appologize);
Act laugh     => qw(smile grin ha hah haha);

Interact take  => qw(pick get grab);
Interact go    => qw(goto enter visit walk);
Interact eat   => qw(munch nibble bite gobble);
Interact drink => qw(slurp gulp);
Interact smell => qw(sniff);
Interact talk  => qw(speak converse);
Interact climb => qw(clamber ascend mount scale);
Interact stand => qw(step stomp);
Interact poke  => qw(boop);


Message welcome => q(Welcome to adventure! Type HELP to get instructions.);


Message no_interpret => q(Eh?);
Message no_interpret => q(What? Maybe try typing "HELP".);
Message no_interpret => q(I don't understand you at all.);
Message no_interpret => q(Does not compute. Please rephrase.);
Message no_interpret => q(I can't even begin to make sense of that sentence.);


Message no_look => q(
    You don't see anything because the programmer forgot to give this thing a
    description. Sorry.
);

Message no_use => q(It's utterly useless.);
Message no_use => q(You have no use for it.);
Message no_use => q(That's just not useful.);

Message no_take => q(You don't really want it.);
Message no_take => q(You can't take that with you.);
Message no_take => q(You'd rather not carry that around with you.);

Message no_eat => q(It's inedible.);
Message no_eat => q(You couldn't stomach that.);
Message no_eat => q(That's not something you can eat.);

Message no_drink => q(It's not potable.);
Message no_drink => q(That's undrinkable.);
Message no_drink => q(You can't get drunk off of that.);

Message no_smell => q(There's no smell to speak of.);
Message no_smell => q(It's got a very generic smell.);
Message no_smell => q(It smells of absolutely nothing.);

Message no_talk => q(You get no response.);
Message no_talk => q(It's not very talkative.);

Message no_climb => q(Your climbing skill is too low.);
Message no_climb => q(It's not a climbable surface.);

Message no_stand => q(Don't put your feet all over that.);
Message no_stand => q(It doesn't look like it could support your weight.);

Message no_apologize => q(It doesn't seem to care for your apologies.);

Message no_combine => q(They don't go together.);
Message no_combine => q(Don't know how to put those two together);

Message no_drop  => q(You're nowhere near your carrying limit.);
Message no_cast  => q(You don't have enough mana.);
Message no_reach => q(And what would you do if you reached it?);

Message no_lick => q(It's unlickable.);
Message no_lick => q(Stop that, it's rude.);
Message no_lick => q(No, there's germs on it.);
Message no_lick => q(You're not putting your lips on that.);
Message no_lick => q(
    Quit it, we can get you a lollipop later if you really need to lick
    something.
);

Message no_poke => q(It misses.);
Message no_poke => q(It failed.);
Message no_poke => q(You're out of poke points.);
Message no_poke => q(You try to poke it, but it resists.);
Message no_poke => q(It's defense is too high for your poke.);
Message no_poke => q(
    You poke, but miss so badly that you just hit your own nose instead.
);

Message no_touch => q(It's untouchable.);
Message no_touch => q(Just touching it won't get you anywhere.);
Message no_touch => q(
    You think about rubbing your hands all over it, but then realize that
    that's both weird and useless.
);


Message just_cry => q(
    You curl into a ball on the floor and have a little time to yourself. You
    do feel a little better afterwards.
);
Message just_cry => q(
    You break out in tears at the unfairness of it all. It has no effect on the
    cruel world around you.
);
Message just_cry => q(
    You look over your shoulder, with a serious expression of desperation on
    your face. A single tear rolls down your cheek.
);
Message just_cry => q(
    You start sobbing uncontrollably. It takes several minutes before you calm
    down again, but you've regained some of your motivation.
);
Message just_cry => q(
    You lose your composure and start bawling your eyes out. You don't stop
    until your throat hurts and your voice is raspy. However, after having a
    little whinge, you feel more determined than ever.
);

Message just_die => q(You cannot.);
Message just_die => q(Nah, you're good.);
Message just_die => q(Surrender is not an option.);
Message just_die => q(There is no lose state in this game.);
Message just_die => q(But you still have so much to live for!);
Message just_die => q(Aw come on, you're not that desperate yet.);

Message just_kill => q(You're too weak.);
Message just_kill => q(Don't be so aggressive.);
Message just_kill => q(You don't have the guts.);
Message just_kill => q(Your strength is too low.);
Message just_kill => q(You don't want to risk retaliation.);
Message just_kill => q(No, you might hurt yourself doing that.);
Message just_kill => q(Maybe you should look into your violent tendencies.);

Message just_apologize => q(I forgive you.);
Message just_apologize => q(That's alright.);
Message just_apologize => q(No problem.);
Message just_apologize => q(Don't worry about it.);
Message just_apologize => q(What you've done is beyond apologies.);

Message just_flex  => q(You FLEX your muscles. It intimidates no one.);
Message just_laugh => q(Aren't you a happy cookie.);

Message just_xyzzy => q(Nothing happens.);
Message just_plugh => q(A hollow voice says "nothing happens.");

Message just_yes => q(No.);
Message just_yes => q(Nah.);
Message just_yes => q(Nope.);
Message just_yes => q(Nuh-uh.);
Message just_yes => q(Um, no.);
Message just_yes => q(Negatory.);

Message just_no => q(Yes.);
Message just_no => q(Yup.);
Message just_no => q(Yeah.);
Message just_no => q(Mh-hm.);
Message just_no => q(Uh, yes.);
Message just_no => q(Positive.);

Message just_clap => q(You clap your hands.);

for my $prefix (qw(just no)) {
    for my $action (qw(sit lay lie rest sleep laze drop)) {
        Message "${prefix}_$action" => "Not right now.";
        Message "${prefix}_$action" => "Quit being so lazy.";
        Message "${prefix}_$action" => "You can do that later.";
        Message "${prefix}_$action" => "You're not tired enough.";
        Message "${prefix}_$action" => "You do that enough all day already.";
    }
}

{
    my @verbs = qw(
        look_at_what check see investigate view inspect examine take pick get
        grab go_where goto_where enter_where visit walk_where eat munch nibble
        bite gobble drink slurp gulp smell sniff talk_to_whom speak_to_whom
        climb clamber ascend_where mount scale stand_on_what step_on_what
        stomp_on_what watch converse_with_whom
    );
    for (@verbs) {
        my ($verb, @rest) = split /_/;
        my $what = @rest ? join(' ', @rest) : 'what';
        Message "just_$verb" => "\U$verb\E $what?";
    }
}


Message no_insult => "You call it $_." for
    "dumb",
    "ugly",
    "silly",
    "a bum",
    "smelly",
    "boring",
    "a bigot",
    "ignorant",
    "offensive",
    "a dumb thing",
    "a waste of space",
    "the worst game object you've ever seen";


Message just_help => q(
    Type a topic you want help about:

    * HELP GAME

    * HELP COMMANDS

    * HELP COMMON

    * HELP TIPS
);

Message help_me       => q(You're beyond HELP.);
Message help_yourself => q(Thank you, how considerate.);
Message help_help     => q(
    The HELP will try to HELP you if you give it a sensible topic.
);


Message help_game => q(
    This is a text adventure game. You type simple commands as to what you want
    to do any get responses from the computer.

    You progress by figuring out the inventory object puzzles. This involves
    picking up stuff, combining it with other stuff and using your own
    deductive skills.

    You can't die or make the game unwinnable (even though you'll no doubt try
    your hardest.)
);


Message help_commands => q(
    There are three types of commands:

    A single word, like LOOK or INVENTORY. This will just do something, like
    look around the room or tell you what you have in your inventory.

    A verb and a noun, like LOOK AT THING or OPEN DOOR. This will try to do the
    action to the thing, like telling you what the thing looks like or opening
    the door.

    A verb and two nouns, like COMBINE ICE WITH CREAM. This will try to put the
    two things together, like producing ice cream (which is totally logical).
);


Message help_common => q(
    These are the most common commands. To save you some typing, you can
    abbreviate them with their first letter (like I instead of INVENTORY or U
    instead of USE).

    * INVENTORY

    * LOOK

    * LOOK/USE/TAKE/SPEAK (something)

    * GO (somewhere)

    * COMBINE (something) WITH (something else)
);


Message help_tips => q(
    If you forget what's in a room, just type LOOK.

    Pick up everything that isn't nailed down. And if it is nailed down, figure
    out a way to pull out the nails.

    You can GO to rooms you've been to before directly, no need to traverse
    every room along the way.

    If you're stuck, look at everything you have and read the descriptions
    attentively, they may give you a hint.

    Think outside the box and think literally - this game is made out of text
    after all.
);
