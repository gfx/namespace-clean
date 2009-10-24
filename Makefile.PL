#!/usr/bin/env perl

BEGIN{ # for co-developers
    require Module::Install::XSUtil;
}

use warnings;
use strict;

use inc::Module::Install;

name            q{namespace-clean};
all_from        q{lib/namespace/clean.pm};

use_ppport 3.19;
cc_warnings;

test_requires  q{Test::More},                  '0.62';
test_requires  q{FindBin},                     0;

if ($Module::Install::AUTHOR) {

    print "Creating README file\n";
    system 'pod2text lib/namespace/clean.pm > README';

    print "Adding author tests to 'make test' run\n";
    tests 't/*.t t_author/*.t';
}

WriteAll;
