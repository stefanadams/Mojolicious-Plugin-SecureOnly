package Mojolicious::Plugin::SecureOnly;
use Mojo::Base 'Mojolicious::Plugin';

our $VERSION = '0.01';

sub register {
  my ($self, $app, $config) = @_;

  $app->hook(before_dispatch => sub {
    my $c = shift;
    return if $ENV{MOJO_NO_SECUREONLY} || $app->config('no_secureonly') || $c->req->is_secure;

    my $url = $c->req->url->to_abs;
    $url->scheme('https');
    $url->port($config->{secureport}) if $config->{secureport};
    $c->app->log->debug("SecureOnly: $url");
    $c->redirect_to($url);
  });
}

1;
__END__

=encoding utf8

=head1 NAME

Mojolicious::Plugin::SecureOnly - Mojolicious Plugin to force all requests
secure.

=head1 SYNOPSIS

  # Mojolicious
  $self->plugin('SecureOnly');

  # Mojolicious::Lite
  plugin 'SecureOnly' => {secureport => 3001};

=head1 DESCRIPTION

L<Mojolicious::Plugin::SecureOnly> is a L<Mojolicious> plugin that will redirect
all insecure requests to a secure resource.

=head1 METHODS

L<Mojolicious::Plugin::SecureOnly> inherits all methods from
L<Mojolicious::Plugin> and implements the following new ones.

=head2 register

  $plugin->register(Mojolicious->new);

Register plugin in L<Mojolicious> application.

=head1 SEE ALSO

L<Mojolicious>, L<Mojolicious::Guides>, L<http://mojolicio.us>.

=cut
