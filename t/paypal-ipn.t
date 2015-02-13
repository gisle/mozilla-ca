#!/usr/bin/env perl

use strict;
use warnings;

# This test will fail under Mozilla::CA 20141217 and IO::Socket::SSL 2.012

use IO::Socket::SSL;
use Mozilla::CA;
use Test::More;
use Test::RequiresInternet ( 'ipnpb.paypal.com' => 443 );

my $host = 'ipnpb.paypal.com';

my $client = IO::Socket::SSL->new(
    PeerHost        => "$host:443",
    SSL_verify_mode => 0x02,
    SSL_ca_file     => Mozilla::CA::SSL_ca_file(),
) || fail( "Can't connect: $@" );

if ( $client ) {
    ok( $client->verify_hostname( $host, "http" ), 'hostname verified' );
}
diag( 'ssl_ca_file : ' . Mozilla::CA::SSL_ca_file() );
done_testing();
