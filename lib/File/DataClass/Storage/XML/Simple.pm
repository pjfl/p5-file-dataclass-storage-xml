package File::DataClass::Storage::XML::Simple;

use namespace::autoclean;

use File::DataClass::Constants qw( TRUE );
use XML::Simple;
use Moo;

extends qw(File::DataClass::Storage::XML);

sub read_from_file {
   my ($self, $rdr) = @_;

   $self->encoding and $rdr->encoding( $self->encoding );

   my $data = $self->_dtd_parse( $rdr->all );
   my $xs   = XML::Simple->new( SuppressEmpty => TRUE );

   return $xs->xml_in( $data, ForceArray => [ keys %{ $self->_arrays } ] );
}

sub write_to_file {
   my ($self, $wtr, $data) = @_;

   my $xs = XML::Simple->new( NoAttr   => TRUE, SuppressEmpty => TRUE,
                              RootName => $self->root_name );

   $self->encoding and $wtr->encoding( $self->encoding );
   $self->_dtd->[ 0 ] and $wtr->println( @{ $self->_dtd } );
   $wtr->append( $xs->xml_out( $data ) );
   return $data;
}

1;

__END__

=pod

=head1 Name

File::DataClass::Storage::XML::Simple - Read/write XML data storage model

=head1 Synopsis

   use Moo;

   extends qw(File::DataClass::Schema);

   has '+storage_class' => default => q(XML::Simple);

=head1 Description

Uses L<XML::Simple> to read and write XML files

=head1 Subroutines/Methods

=head2 read_from_file

Defines the closure that reads the file, parses the DTD, parses the
file using L<XML::Simple>. Calls
L<read file with locking|File::DataClass::Storage::XML/_read_file_with_locking>
in the base class

=head2 write_to_file

Defines the closure that writes the DTD and data to file

=head1 Diagnostics

None

=head1 Configuration and Environment

None

=head1 Dependencies

=over 3

=item L<File::DataClass::Storage::XML>

=item L<XML::Simple>

=back

=head1 Incompatibilities

There are no known incompatibilities in this module

=head1 Bugs and Limitations

There are no known bugs in this module.
Please report problems to the address below.
Patches are welcome

=head1 Author

Peter Flanigan, C<< <pjfl@cpan.org> >>

=head1 License and Copyright

Copyright (c) 2013 Peter Flanigan. All rights reserved

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself. See L<perlartistic>

This program is distributed in the hope that it will be useful,
but WITHOUT WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE

=cut

# Local Variables:
# mode: perl
# tab-width: 3
# End:
