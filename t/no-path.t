#!perl

# For coverage. SSL_ca_file includes a conditional branch if the
# __FILE__ name is not absolute. This is not tested elsewhere
# so this test file exists simply to follow that branch and complete
# the code coverage.

use strict;
use Test qw(plan ok);
plan tests => 3;

use lib './blib/lib';
ok(require Mozilla::CA);
my $ca_file = Mozilla::CA::SSL_ca_file();
ok($ca_file);
ok(-f $ca_file);
