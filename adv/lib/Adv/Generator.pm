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
package Adv::Generator;
use Moose;
use 5.020;
use experimental qw(signatures);
use Mojo::Loader qw(data_section);
use Mojo::Util qw(spurt);
use Mojo::Template;


has adv => (
    is       => 'ro',
    isa      => 'Adv::Enture',
    required => 1,
);


sub _escape ($str) {
    $str =~ s/"/\\"/g;
    $str =~ s/\n/\\n/g;
    return $str;
}

sub _mt () {
    return Mojo::Template->new(
        auto_escape => 0,
        escape      => \&_escape,
        vars        => 1,
    );
}


sub _gen_data ($self) {
    my $react = _mt->render(
        data_section(__PACKAGE__, 'Data.hx.ep'),
        {adv => $self->adv},
    );
    spurt $react, 'Data.hx';
}


sub _gen_things ($self) {
    my $things = _mt->render(
        data_section(__PACKAGE__, 'Thing.hx.ep'),
        {adv => $self->adv},
    );
    spurt $things, 'Thing.hx';
}


sub generate ($self) {
    $self->_gen_data;
    $self->_gen_things;
}


__PACKAGE__->meta->make_immutable;

__DATA__

@@ Data.hx.ep
% my %reactions = %{$adv->reactions};
% my %messages  = %{$adv->messages};
% my @keys      = sort keys %reactions;
package adv;

/***********************/
/* AUTO-GENERATED FILE */
/***********************/

class Data
{
    public static var stopwords:Array<String> = [
%     for (@{$adv->stopwords}) {
        "<%== $_ %>",
%     }
    ];

    public static var replacements:Array<{word:String, re:EReg}> = [
%     for (@{$adv->replacements}) {
%       my ($word, @subjects) = @$_;
%       my $re = join '|', map { s/\s+/\\s+/gr } @subjects;
        {word : "<%== $word %>", re : ~/\b(?:<%= $re %>)\b/},
%     }
    ];


    public static var verbs:Map<String, String> = [
%     for (sort keys %{$adv->acts}) {
        "act/<%= $_ %>" => "<%= $adv->acts->{$_} %>",
%     }
%     for (sort keys %{$adv->interacts}) {
        "interact/<%= $_ %>" => "<%= $adv->interacts->{$_} %>",
%     }
        "_DUMMY" => null,
    ];


    public static var pre:Map<String, Adventure -> Bool> = [
%     for (grep { /^pre/ } @keys) {
        "<%= s|^[^/]*/||r %>" => function (adv:Adventure):Bool {
%=          $reactions{$_} =~ s/^/    /gmr =~ s/^\s+$//gmr;
        },

%     }
        "_DUMMY" => null,
    ];


    public static var amend:Map<String, Adventure -> String -> String> = [
%     for (grep { /^amend/ } @keys) {
        "<%= s|^[^/]*/||r %>" => function (adv:Adventure, msg:String):String {
%=          $reactions{$_} =~ s/^/    /gmr =~ s/^\s+$//gmr;
        },

%     }
        "_DUMMY" => null,
    ];


    public static var post:Map<String, Adventure -> Void> = [
%     for (grep { /^post/ } @keys) {
        "<%= s|^[^/]*/||r %>" => function (adv:Adventure):Void {
%=          $reactions{$_} =~ s/^/    /gmr =~ s/^\s+$//gmr;
        },

%     }
        "_DUMMY" => null,
    ];


    public static var messages:Map<String, Array<String>> = [
%     for (sort keys %messages) {
        "<%= $_ %>" => [
%         for my $msg (@{$messages{$_}}) {
            "<%== $msg %>",
%         }
        ],

%     }
        "_DUMMY" => null,
    ];
}


@@ Thing.hx.ep
package adv;

/***********************/
/* AUTO-GENERATED FILE */
/***********************/

class Thing
{
    public var id     (default, null):String;
    public var name   (default, null):String;
    public var inv    (default, null):String;
    public var aliases(default, null):Array<String>;
    public var verbs  (default, null):Map<String, String>;

    public function new(id, name, inv, aliases, verbs)
    {
        this.id      = id;
        this.name    = name;
        this.inv     = inv;
        this.verbs   = verbs;
        this.aliases = aliases;
    }

    public function like(noun:String):Bool
    {
        return aliases.indexOf(noun) != -1;
    }

    public function resolveVerb(verb:String):String
    {
        return verbs != null && verbs.exists(verb) ? verbs[verb] : verb;
    }

% for (sort { $a->id cmp $b->id } values %{$adv->things}) {

    public static var <%= $_->id %> = new Thing(
        "<%== $_->id %>",
        "<%== $_->name %>",
        "<%== $_->inv %>",
        [
%         for my $alias ($_->unique_aliases) {
            "<%== $alias %>",
%         }
        ],
%     if (%{$_->verbs}) {
        [
%         while (my ($k, $v) = each %{$_->verbs}) {
            "<%== $k %>" => "<%== $v %>",
%         }
        ]
%     }
%     else {
        null
%     }
    );
% }
}
