use t::boilerplate;

use English qw( -no_match_vars );
use File::DataClass::IO;
use File::Spec::Functions qw( catfile );
use Test::More;
use Text::Diff;

use_ok 'File::DataClass::Schema';

my $args   = { path          => catfile( qw( t default.xml ) ),
               storage_class => 'XML::Bare',
               tempdir       => 't', };
my $schema = File::DataClass::Schema->new( $args );

isa_ok $schema, 'File::DataClass::Schema';

my $dumped = catfile( qw( t dumped.xml ) ); io( $dumped )->unlink;

$schema->dump( { data => $schema->load, path => $dumped } );

my $diff = diff catfile( qw( t default.xml ) ), $dumped;

ok( !$diff, 'Load and dump roundtrips' ); io( $dumped )->unlink;

$schema->dump( { data => $schema->load, path => $dumped } );

$diff = diff catfile( qw( t default.xml ) ), $dumped;

ok( !$diff, 'Load and dump roundtrips 2' );

done_testing;

# Cleanup
io( $dumped )->unlink;
io( catfile( qw( t ipc_srlock.lck ) ) )->unlink;
io( catfile( qw( t ipc_srlock.shm ) ) )->unlink;
io( catfile( qw( t file-dataclass-schema.dat ) ) )->unlink;

# Local Variables:
# mode: perl
# tab-width: 3
# End:
