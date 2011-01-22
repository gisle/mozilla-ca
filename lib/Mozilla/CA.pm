package Mozilla::CA;

use strict;
our $VERSION = '20110121';

1;

__END__

=head1 NAME

Mozilla::CA - Mozilla's CA cert bundle in PEM format

=head1 DESCRIPTION

Mozilla::CA provides a copy of Mozilla's bundle of Certificate Authority
certificates in a form that can be consumed by modules and libraries
based on OpenSSL.

=head1 SEE ALSO

L<http://curl.haxx.se/docs/caextract.html>
