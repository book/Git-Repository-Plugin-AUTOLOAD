package Git::Repository::Plugin::AUTOLOAD;

use warnings;
use strict;
use 5.006;

use Git::Repository::Plugin;
our @ISA = qw( Git::Repository::Plugin );
sub _keywords {qw( AUTOLOAD )}

sub AUTOLOAD {
    my ($self) = shift;

    # get the command name
    ( my $cmd = our $AUTOLOAD ) =~ s/.*:://;
    $cmd =~ y/_/-/;

    # but ignore some commands
    return if $cmd eq 'DESTROY';

    # run it
    return $self->run( $cmd, @_ );
}

1;

