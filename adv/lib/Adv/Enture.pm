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
package Adv::Enture;
use Moose;
use MooseX::Types::Moose qw(ArrayRef Bool HashRef Str);
use 5.020;
use experimental qw(signatures);
use Adv::Generator;
use Adv::Thing;


has stopwords => (
    is       => 'ro',
    isa      => ArrayRef[Str],
    required => 1,
    default  => sub { [] },
    traits   => ['Array'],
    handles  => {
        add_stopwords => 'push',
    },
);

has replacements => (
    is       => 'ro',
    isa      => ArrayRef[ArrayRef[Str]],
    required => 1,
    default => sub { [] },
    traits  => ['Array'],
    handles => {
        add_replacement => 'push',
    },
);

has acts => (
    is       => 'ro',
    isa      => HashRef[Str],
    required => 1,
    default  => sub { {} },
    traits   => ['Hash'],
    handles  => {
        add_act => 'set',
    },
);

has interacts => (
    is       => 'ro',
    isa      => HashRef[Str],
    required => 1,
    default  => sub { {} },
    traits   => ['Hash'],
    handles  => {
        add_interact => 'set',
    },
);

has things => (
    is       => 'ro',
    isa      => HashRef['Adv::Thing'],
    required => 1,
    default  => sub { {} },
    traits   => ['Hash'],
    handles  => {
        thing => 'accessor',
    },
);

has reactions => (
    is       => 'ro',
    isa      => HashRef[Str],
    required => 1,
    default  => sub { {} },
    traits   => ['Hash'],
    handles  => {
        reaction => 'accessor',
    },
);

has messages => (
    is       => 'ro',
    isa      => HashRef[ArrayRef[Str]],
    required => 1,
    default => sub { {} },
    traits  => ['Hash'],
    handles => {
        message => 'accessor',
    },
);

has needed => (
    is       => 'ro',
    isa      => HashRef[Bool],
    required => 1,
    default  => sub { {} },
    traits   => ['Hash'],
    handles  => {
        needed_thing  => 'set',
        needed_things => 'keys',
    },
);


sub _has_thing ($self, @names) {
    $self->needed_thing($_ => 1) for @names;
}


sub add_thing ($self, $id) {
    confess "Thing '$id' already exists" if $self->thing($id);
    return $self->thing($id => Adv::Thing->new(id => $id));
}


sub add_message ($self, $key, $message) {
    $message =~ s/^\s+|\s+$//g;
    $message =~ s/\n{2,}/¶/g;
    $message =~ s/\s+/ /g;
    $message =~ s/¶/\n\n/g;
    $message =~ s/^\h+|\h+$//gm;

    my @messages = @{$self->message($key) || []};
    push @messages, $message;
    $self->message($key => \@messages);
}


sub add_action ($self, $action, $id, $message) {
    $self->_has_thing($id);
    $self->add_message("$action/$id", $message);
}


sub add_combination ($self, $things, $message) {
    $self->_has_thing(@$things);
    my $key = join '/', 'combine', sort @$things;
    $self->add_message($key, $message);
}


sub _filter_q ($self, $message) {
    $message =~ s/^\s+|\s+$//g;
    $message =~ s/\n{2,}/¶/g;
    $message =~ s/\s+/ /g;
    $message =~ s/¶/\n\n/g;
    $message =~ s/^\h+|\h+$//gm;
    $message =~ s/('|\n)/\\$1/g;
    return "'$message'";
}

sub _filter_line ($self, $line) {
    state $shortcuts = {
        '+' => 'adv.room.add(Thing.%s)',
        '-' => 'adv.room.remove(Thing.%s)',
        '^' => 'adv.inv.add(Thing.%s)',
        '~' => 'adv.inv.remove(Thing.%s)',
        '>' => 'adv.setRoom("%s")',
    };
    state $markers = quotemeta join '', keys %$shortcuts;

    $line = "        $line" unless $line =~ /^\s+/;
    return $line unless $line =~ /^(\s*)[$markers]\S/;
    my $indent = $1;
    my @lines;

    while ($line =~ /(\S)(\S*)/g) {
        my ($prefix, $id) = ($1, $2);
        my $fmt = $shortcuts->{$prefix} or confess "Invalid shortcut '$prefix'";
        $self->_has_thing($id);
        push @lines, sprintf "%s$fmt;", $indent, $id;
    }

    return @lines;
}

sub _filter_code ($self, $code) {
    $code =~ s/^\s+|\s+$//g;
    $code =~ s/\bq\(([^\)]*)\)/$self->_filter_q($1)/ge;
    my @lines = split "\n", $code;
    return join "\n", map { $self->_filter_line($_) } @lines;
}


sub react ($self, $when, $action, $index, $things, $code) {
    $self->_has_thing(@$things);

    my $key = join '/', $action, sort @$things;
    if (!$self->message($key) && !$Adv::shush) {
        confess "No messages exist for '$key'";
    }

    $key = "$when/$key";
    $key .= "/[$index]" if $index;
    confess "Reaction '$key' already exists" if $self->reaction($key);

    return $self->reaction($key => $self->_filter_code($code));
}


sub _check_things ($self) {
    my @missing;
    for (sort $self->needed_things) {
        push @missing, $_ unless $self->thing($_);
    }
    if (@missing) {
        my $msg = join ', ', map { "'$_'" } @missing;
        die "Missing thing(s): $msg\n";
    }
}


sub generate ($self) {
    $self->_check_things;
    Adv::Generator->new(adv => $self)->generate;
}


__PACKAGE__->meta->make_immutable;
