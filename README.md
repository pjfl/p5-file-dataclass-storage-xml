# Name

File::DataClass::Storage::XML - Read/write XML data storage model

# Version

This document describes version v0.28.$Rev: 2 $

# Synopsis

This is an base class. See one of the subclasses for a concrete
example

# Configuration and Environment

Defines the following attributes;

- `extn`

    The extension appended to filenames. Defaults to `.xml`

- `meta_pack`

    Adds the DTD to the meta data

- `meta_unpack`

    Extracts the DTD from the meta data

- `root_name`

    Defaults to `config`. The name of the outer containing element

# Description

Implements the basic storage methods for reading and writing XML files

# Subroutines/Methods

No public methods

# Diagnostics

None

# Dependencies

- [File::DataClass::Storage](https://metacpan.org/pod/File::DataClass::Storage)

# Incompatibilities

There are no known incompatibilities in this module

# Bugs and Limitations

There are no known bugs in this module.
Please report problems to the address below.
Patches are welcome

# Author

Peter Flanigan, `<pjfl@cpan.org>`

# License and Copyright

Copyright (c) 2013 Peter Flanigan. All rights reserved

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself. See [perlartistic](https://metacpan.org/pod/perlartistic)

This program is distributed in the hope that it will be useful,
but WITHOUT WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE
