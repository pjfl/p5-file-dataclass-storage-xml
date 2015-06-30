use t::boilerplate;

use English qw( -no_match_vars );
use File::DataClass::IO;
use File::Spec::Functions qw( catfile );
use Test::More;
use Text::Diff;

sub test {
   my ($obj, $method, @args) = @_; local $EVAL_ERROR;

   my $wantarray = wantarray; my $res;

   eval {
      if ($wantarray) { @{ $res } = $obj->$method( @args ) }
      else { $res = $obj->$method( @args ) }
   };

   $EVAL_ERROR and return $EVAL_ERROR;

   return $wantarray ? @{ $res } : $res;
}

use_ok 'File::DataClass::Schema';

my $path   = catfile( qw( t dtd_test.xml ) );
my $dumped = catfile( qw( t dumped.xml ) );
my $schema = File::DataClass::Schema->new
   ( cache_class   => 'none',
     path          => [ qw( t dtd_test.xml ) ],
     storage_class => 'XML::Simple',
     tempdir       => 't' );

isa_ok $schema, 'File::DataClass::Schema';

my $data = $schema->load;

ok( $data->{ '_cvs_default' } =~ m{ @\(\#\)\$Id: }mx,
    'Has reference element 1' );

ok( ref $data->{levels}->{entrance}->{acl} eq 'ARRAY', 'Detects arrays' );

$schema = File::DataClass::Schema->new
   ( cache_class        => 'none',
     path               => [ qw( t dtd_test.xml ) ],
     storage_attributes => { force_array => [ qw( fields ) ] },
     storage_class      => 'XML::Simple',
     tempdir            => 't' );

$data = $schema->load;

ok( ref $data->{fields}->{ 'app_closed.passwd' } eq 'HASH', 'Force array' );

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
