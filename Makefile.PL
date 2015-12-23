use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Mojolicious::Plugin::SecureOnly',
  VERSION_FROM => 'lib/Mojolicious/Plugin/SecureOnly.pm',
  AUTHOR       => 'A Good Programmer <nospam@cpan.org>',
  PREREQ_PM    => {'Mojolicious' => '6.37'},
  test         => {TESTS => 't/*.t'}
);
