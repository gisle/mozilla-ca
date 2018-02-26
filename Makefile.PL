require 5.006;
use ExtUtils::MakeMaker;

WriteMakefile(
   NAME => "Mozilla::CA",
   VERSION_FROM => "lib/Mozilla/CA.pm",
   ABSTRACT_FROM => "lib/Mozilla/CA.pm",
   AUTHOR => 'Gisle Aas <gisle@activestate.com>',
   LICENSE => 'open_source',
   MIN_PERL_VERSION => 5.006,
   META_MERGE => {
      'meta-spec' => { version => 2 },
      dynamic_config => 0,
      resources => {
         homepage => 'https://github.com/gisle/mozilla-ca',
         license => [
            'https://www.mozilla.org/media/MPL/2.0/index.txt'
         ],
         bugtracker => {
            web => 'https://rt.cpan.org/Public/Dist/Display.html?Name=Mozilla-CA'
         },
         repository => {
            url => 'https://github.com/gisle/mozilla-ca.git',
            web => 'https://github.com/gisle/mozilla-ca',
            type => 'git',
         },
      },
   },
   TEST_REQUIRES => {
       Test => 0,
   },
);

BEGIN {
    # compatibility with older versions of MakeMaker
    my $developer = -d "eg";
    my %mm_req = (
        LICENCE => 6.31,
        META_MERGE => 6.45,
        META_ADD => 6.45,
        MIN_PERL_VERSION => 6.48,
        TEST_REQUIRES => 6.63_03,
    );
    undef(*WriteMakefile);
    *WriteMakefile = sub {
        my %arg = @_;
        for (keys %mm_req) {
            unless (eval { ExtUtils::MakeMaker->VERSION($mm_req{$_}) }) {
                warn "$_ $@" if $developer;
                delete $arg{$_};
            }
        }
        ExtUtils::MakeMaker::WriteMakefile(%arg);
    };
}
