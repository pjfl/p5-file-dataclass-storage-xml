requires "File::DataClass" => "v0.63.0";
requires "Moo" => "2.000001";
requires "XML::Bare" => "0.53";
requires "XML::Simple" => "2.20";
requires "namespace::autoclean" => "0.26";
requires "perl" => "5.01";

on 'build' => sub {
  requires "Module::Build" => "0.4004";
  requires "Test::Requires" => "0.06";
  requires "version" => "0.88";
};

on 'configure' => sub {
  requires "Module::Build" => "0.4004";
  requires "version" => "0.88";
};
