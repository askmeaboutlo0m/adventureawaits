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
package Adv;
use 5.020;
use warnings;
use experimental qw(signatures);
use Adv::Enture;
use Carp qw(confess);
use Sub::Install;

use base qw(Exporter);


sub import {
    $_->import for qw(strict warnings utf8);
    feature->import(':5.20');
    goto &Exporter::import;
}


sub dsl ($id, $code) {
    Sub::Install::install_sub({
        as   => $id,
        code => sub {
            local *__ANON__ = $id;
            return $code->(@_);
        },
    });
    our @EXPORT;
    push @EXPORT, $id;
}


our $adv = Adv::Enture->new;
our $current;


dsl Stopwords => sub (@words) {
    $adv->add_stopwords(@words);
};


dsl Replace => sub ($with, $subject, @more_subjects) {
    $adv->add_replacement([$with, $subject, @more_subjects]);
};

dsl Act => sub ($verb, @aliases) {
    for my $alias (@aliases) {
        $adv->add_act($alias => $verb);
    }
};

dsl Interact => sub ($verb, @aliases) {
    for my $alias (@aliases) {
        $adv->add_interact($alias => $verb);
    }
};


dsl Message => sub ($key, $message) {
    $adv->add_message($key, $message);
};


dsl Thing => sub ($id, $sub) {
    local $current = $adv->add_thing($id);
    $sub->();
};

dsl Stuff => sub ($id, $sub) {
    local $current = $adv->thing($id) || $adv->add_thing($id);
    $sub->();
};

dsl Name => sub ($name) {
    $current->name($name);
};

dsl Inv => sub ($inv) {
    $current->inv($inv);
};

dsl Alias => sub (@aliases) {
    $current->add_aliases(@aliases);
};

dsl With => sub ($other, $message) {
    $adv->add_combination([$current->id, $other], $message);
};

dsl WithAny => sub ($message) {
    $adv->add_combination([$current->id], $message);
};


for my $action (qw(go look take use eat drink smell talk climb stand)) {
    dsl "\u$action" => sub ($message) {
        $adv->add_action($action, $current->id, $message);
    };

    dsl "As\u$action" => sub (@verbs) {
        $current->add_verbs($_ => $action) for @verbs;
    };

    dsl "Pre\u$action" => sub ($code) {
        $adv->react(pre => $action, undef, [$current->id], $code);
    };

    dsl "Amend\u$action" => sub ($code) {
        $adv->react(amend => $action, undef, [$current->id], $code);
    };

    dsl "On\u$action" => sub ($code) {
        $adv->react(post => $action, undef, [$current->id], $code);
    };

    dsl "Once\u$action" => sub ($code) {
        $adv->react(post => $action, 1, [$current->id], $code);
    };
}


dsl PreCombine => sub ($other, $code) {
    $adv->react(pre => 'combine', undef, [$current->id, $other], $code);
};

dsl AmendCombine => sub ($other, $code) {
    $adv->react(amend => 'combine', undef, [$current->id, $other], $code);
};

dsl OnCombine => sub ($other, $code) {
    $adv->react(post => 'combine', undef, [$current->id, $other], $code);
};

dsl OnceCombine => sub ($other, $code) {
    $adv->react(post => 'combine', 1, [$current->id, $other], $code);
};


dsl Generate => sub () {
    $adv->generate;
};


1;
