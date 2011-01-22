package Mozilla::CA;

use strict;
our $VERSION = '20110122';

use Cwd ();
use File::Spec ();
use File::Basename qw(dirname);

sub SSL_ca_file {
    my $file = File::Spec->catfile(dirname(__FILE__), "CA", "cacert.pem");
    if (!File::Spec->file_name_is_absolute($file)) {
	$file = File::Spec->catfile(Cwd::cwd(), $file);
    }
    return $file;
}

1;

__END__

=head1 NAME

Mozilla::CA - Mozilla's CA cert bundle in PEM format

=head1 SYNOPSIS

    use Mozilla::CA;
    use IO::Socket::SSL;

    my $client = IO::Socket::SSL->new(
        PeerHost => "www.example.com:https",
	SSL_ca_file => Mozilla::CA::SSL_ca_file(),
    );

=head1 DESCRIPTION

Mozilla::CA provides a copy of Mozilla's bundle of Certificate Authority
certificates in a form that can be consumed by modules and libraries
based on OpenSSL.

The module provide a single function:

=over

=item SSL_ca_file()

Returns the absolute path to the Mozilla's CA cert bundle PEM file.

=back

=head1 SEE ALSO

L<http://curl.haxx.se/docs/caextract.html>
