#!perl

use strict;
use Test qw(plan ok);
plan tests => 3;

use Mozilla::CA;

my $ca_file = Mozilla::CA::SSL_ca_file();
print "# $ca_file\n";
ok($ca_file);
ok(open(my $fh, "<", $ca_file));
while (<$fh>) {
    if (/--BEGIN CERTIFICATE--/) {
	ok(1);
	last;
    }
}
