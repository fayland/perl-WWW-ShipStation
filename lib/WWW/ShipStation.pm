package WWW::ShipStation;

use strict;
use 5.008_005;
our $VERSION = '0.01';

use LWP::UserAgent;
use JSON;
use Carp 'croak';

sub new {
    my $class = shift;
    my %args  = @_ % 2 ? %{$_[0]} : @_;

    $args{user} or croak "user is required.";
    $args{pass} or croak "pass is required.";

    $args{ua} = LWP::UserAgent->new();
    $args{json} = JSON->new->allow_nonref->utf8;

    $args{ua}->default_header('Accept', 'application/json'); # JSON is better
    $args{ua}->credentials('data.shipstation.com:443', 'ShipStation', $args{user}, $args{pass});

    bless \%args, $class;
}

sub getCarriers {
    (shift)->request('https://data.shipstation.com/1.3/Carriers');
}

sub getMarketplaces {
    (shift)->request('https://data.shipstation.com/1.3/Marketplaces');
}

sub request {
    my ($self, $url) = @_;

    my $resp = $self->{ua}->get($url);
    # use Data::Dumper; print Dumper(\$resp);
    unless ($resp->is_success) {
        return { error => $resp->status_line };
    }
    return $self->{json}->decode($resp->decoded_content);
}


1;
__END__

=encoding utf-8

=head1 NAME

WWW::ShipStation - Blah blah blah

=head1 SYNOPSIS

    use WWW::ShipStation;

=head1 DESCRIPTION

WWW::ShipStation is for L<http://api.shipstation.com/>

refer examples for running code

=head1 METHODS

=head2 new

    my $ws = WWW::ShipStation->new(
        user => 'blabla',
        pass => 'blabla'
    );

=over 4

=item * user

required

=item * pass

required

=item * ua

optional, L<LWP::UserAgent> based.

=item * json

optional, L<JSON> based

=back

=head2 getCarriers

    my $carriers = $ws->getCarriers();

L<http://api.shipstation.com/Carriers-Resource.ashx>

=head2 getMarketplaces

    my $marketplaces = $ws->getMarketplaces();

L<http://api.shipstation.com/Marketplace-Resource.ashx>

=head1 AUTHOR

Fayland Lam E<lt>fayland@gmail.comE<gt>

=head1 COPYRIGHT

Copyright 2014- Fayland Lam

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
