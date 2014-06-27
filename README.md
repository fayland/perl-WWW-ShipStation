# NAME

WWW::ShipStation - Blah blah blah

# SYNOPSIS

    use WWW::ShipStation;

# DESCRIPTION

WWW::ShipStation is for [http://api.shipstation.com/](http://api.shipstation.com/)

refer examples for running code

# METHODS

## new

    my $ws = WWW::ShipStation->new(
        user => 'blabla',
        pass => 'blabla'
    );

- user

    required

- pass

    required

- ua

    optional, [LWP::UserAgent](https://metacpan.org/pod/LWP::UserAgent) based.

- json

    optional, [JSON](https://metacpan.org/pod/JSON) based

## getCarriers

    my $carriers = $ws->getCarriers();

[http://api.shipstation.com/Carriers-Resource.ashx](http://api.shipstation.com/Carriers-Resource.ashx)

## getMarketplaces

    my $marketplaces = $ws->getMarketplaces();

[http://api.shipstation.com/Marketplace-Resource.ashx](http://api.shipstation.com/Marketplace-Resource.ashx)

# AUTHOR

Fayland Lam <fayland@gmail.com>

# COPYRIGHT

Copyright 2014- Fayland Lam

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO
