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
package Adv::Thing;
use Moose;
use MooseX::Types::Moose qw(ArrayRef HashRef Str);
use 5.020;
use experimental qw(signatures);


has id => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

has name => (
    is  => 'rw',
    isa => Str,
);

has inv => (
    is  => 'rw',
    isa => Str,
);

has aliases => (
    is       => 'ro',
    isa      => ArrayRef [Str],
    required => 1,
    default  => sub { [] },
    traits   => ['Array'],
    handles  => {
        _add_aliases => 'push',
    },
);

has verbs => (
    is       => 'ro',
    isa      => HashRef [Str],
    required => 1,
    default  => sub { {} },
    traits   => ['Hash'],
    handles  => {
        add_verbs => 'set',
    },
);


sub BUILD ($self, $args) {
    $self->name(uc $self->id);
    $self->inv(uc $self->id);
}


sub add_aliases ($self, @aliases) {
    for (@aliases) {
        confess "alias '$_' contains invalid characters" unless /^[A-Za-z]+$/g;
    }
    $self->_add_aliases(@aliases);
}


sub unique_aliases ($self) {
    my @aliases = (@{$self->aliases}, $self->id, $self->name);
    my %unique = map { (lc($_) => 1) } @aliases;
    return sort keys %unique;
}


__PACKAGE__->meta->make_immutable;
