use utf8;
use strict;
use warnings;

package DBIx::DR::BindValue;

sub new {
    my ($class, $type, $value) = @_;
    bless [ $type => $value ] => ref($class) || $class;
}

sub DBI_TYPE { $_[0][0] }
sub DBI_VALUE { $_[0][1] }

use overload '""' => sub { $_[0][1] };
1;
