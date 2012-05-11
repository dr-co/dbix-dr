use 5.010001;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'DBIx::DR',
    VERSION_FROM      => 'lib/DBIx/DR.pm', # finds $VERSION
    PREREQ_PM         => {
        DBI         => 1.4,
        Mouse       => 0,
    },
    ABSTRACT_FROM  => 'lib/DBIx/DR.pm', # retrieve abstract from module
    AUTHOR         => 'Dmitry E. Oboukhov <unera@debian.org>',

    BUILD_REQUIRES      => {
       'DBD::SQLite'  =>  1.0
    },
    LICENSE           => 'Artistic License'
);

if (open my $file, '+<', 'Makefile') {
    my @lines = <$file>;
    seek $file, 0, 0;
    truncate $file, 0;
    for (@lines) {
        $_ = "TEST_VERBOSE=1\n" if /^TEST_VERBOSE\s*=\s*.*/;
        print $file $_;
    }
}
