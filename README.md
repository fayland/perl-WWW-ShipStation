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

## getCustomsItems

    my $customitems = $ws->getCustomsItems(
        filter => "Order/OrderNumber eq '1111113'",
    ); # https://data.shipstation.com/1.1/CustomsItems()?$filter=Order/OrderNumber eq '1111113'

[http://api.shipstation.com/CustomsItem-Resource.ashx](http://api.shipstation.com/CustomsItem-Resource.ashx)

## getCustomers

    my $customers = $ws->getCustomers();
    my $customers = $ws->getCustomers(
        orderby => 'Name',
        top => 100
    ); # https://data.shipstation.com/1.1/Customers()?$orderby=Name&$top=100
    my $customers = $ws->getCustomers(
        orderby => 'Name',
        skip => 100,
        top => 100
    ); # https://data.shipstation.com/1.1/Customers()?$orderby=Name&$skip=100&$top=100
    my $customers = $ws->getCustomers(
        customerID => 29229
    ); # https://data.shipstation.com/1.1/Customers(29229)
    my $customers = $ws->getCustomers(
        filter => "Email eq 'support@shipstation.com'"
    ); # http://data.shipstation.com/1.1/Customers()?$filter=Email eq 'support@shipstation.com'

[http://api.shipstation.com/Customer-Resource.ashx](http://api.shipstation.com/Customer-Resource.ashx)

## getMarketplaces

    my $marketplaces = $ws->getMarketplaces();

[http://api.shipstation.com/Marketplace-Resource.ashx](http://api.shipstation.com/Marketplace-Resource.ashx)

## getOrderItems

    my $orderitems = $ws->getOrderItems();
    my $orderitems = $ws->getOrderItems(
        filter => "Order/OrderNumber eq '1018'"
    ); # https://data.shipstation.com/1.1/OrderItems()?$filter=Order/OrderNumber eq '1018'

[http://api.shipstation.com/OrderItems-Resource.ashx](http://api.shipstation.com/OrderItems-Resource.ashx)

## getOrders

    my $orders = $ws->getOrders();
    my $orders = $ws->getOrders(
        filter => "(OrderDate ge datetime'2012-06-30T00:00:00') and (OrderDate le datetime'2012-07-01T00:00:00')",
        expand => 'OrderItems',
    ); # https://data.shipstation.com/1.1/Orders()?$filter=(OrderDate ge datetime'2012-06-30T00:00:00') and (OrderDate le datetime'2012-07-01T00:00:00')&$expand=OrderItems

[http://api.shipstation.com/Order-Resource.ashx](http://api.shipstation.com/Order-Resource.ashx)

## getPackageTypes

    my $packagetypes = $ws->getPackageTypes(
        filter => 'Domestic eq true'
    ); # https://data.shipstation.com/1.1/PackageTypes()?$filter=Domestic eq true

[http://api.shipstation.com/PackageType-Resource.ashx](http://api.shipstation.com/PackageType-Resource.ashx)

## getProducts

    my $products = $ws->getProducts(
        filter => "SKU eq '12345'"
    ); # https://data.shipstation.com/1.1/Products()?$filter=SKU eq '12345'

[http://api.shipstation.com/Product-Resource.ashx](http://api.shipstation.com/Product-Resource.ashx)

## getShipments

    my $shipments = $ws->getShipments(
        filter => "Order/OrderNumber eq '100000001'",
        expand => 'ShipmentItems',
    ); # https://data.shipstation.com/1.1/Shipments()?$filter=Order/OrderNumber%20eq%20'100000001'&$expand=ShipmentItems
    my $shipments = $ws->getShipments(
        filter => "(ShipDate ge datetime'2012-06-01T00:00:00') and (ShipDate lt datetime'2012-06-09T00:00:00')",
    ); # https://data.shipstation.com/1.1/Shipments()?$filter=(ShipDate ge datetime'2012-06-01T00:00:00') and (ShipDate lt datetime'2012-06-09T00:00:00')

[http://api.shipstation.com/ShipmentItem-Resource.ashx](http://api.shipstation.com/ShipmentItem-Resource.ashx)
[http://api.shipstation.com/Shipment-Resource.ashx](http://api.shipstation.com/Shipment-Resource.ashx)

## getShippingProviders

    my $shippingproviders = $ws->getShippingProviders();

L<
>

- getShippingServices

    my $shippingservice = $ws->getShippingServices(
        filter => "(International eq false) and (ProviderId eq 4)"
    ); # https://data.shipstation.com/1.1/ShippingServices()?$filter=(International eq false) and (ProviderId eq 4)

[http://api.shipstation.com/ShippingService%20Resource.ashx](http://api.shipstation.com/ShippingService%20Resource.ashx)

- getStores

    my $stores = $ws->getStores(
        filter => "Active eq true"
    ); # https://data.shipstation.com/1.3/Stores()?$filter=Active eq true

[http://api.shipstation.com/Store-Resource.ashx](http://api.shipstation.com/Store-Resource.ashx)

- getWarehouses

    my $warehouses = $ws->getWarehouses(
        filter => 'Default eq true'
    ); # https://data.shipstation.com/1.1/Warehouses()?$filter=Default eq true

[http://api.shipstation.com/Warehouse-Resource.ashx](http://api.shipstation.com/Warehouse-Resource.ashx)

# AUTHOR

Fayland Lam <fayland@gmail.com>

# COPYRIGHT

Copyright 2014- Fayland Lam

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO
