# NAME

WWW::ShipStation - ShipStation API

# SYNOPSIS

    use WWW::ShipStation;

# DESCRIPTION

WWW::ShipStation is for [http://www.shipstation.com/developer-api/](http://www.shipstation.com/developer-api/)

refer examples for running code

# METHODS

## new

    my $ws = WWW::ShipStation->new(
        user => 'blabla',
        pass => 'blabla'
    );

- user

    required, API key

- pass

    required, API secret

- ua

    optional, [LWP::UserAgent](https://metacpan.org/pod/LWP::UserAgent) based.

- json

    optional, [JSON](https://metacpan.org/pod/JSON) based

## getCarriers

    my $carriers = $ws->getCarriers();

[http://www.shipstation.com/developer-api/#/reference/customers/list-carriers](http://www.shipstation.com/developer-api/#/reference/customers/list-carriers)

## getCustomer

    my $customer = $ws->getCustomer($customer_id);

## getCustomers

    my $customers = $ws->getCustomers();
    my $customers = $ws->getCustomers(
        stateCode => ...
        countryCode => ...
    );

[http://www.shipstation.com/developer-api/#/reference/customers/list-customers/list-customers](http://www.shipstation.com/developer-api/#/reference/customers/list-customers/list-customers)

## getMarketplaces

    my $marketplaces = $ws->getMarketplaces();

[http://www.shipstation.com/developer-api/#/reference/stores/storesmarketplaces/get](http://www.shipstation.com/developer-api/#/reference/stores/storesmarketplaces/get)

## getOrders

    my $orders = $ws->getOrders();
    my $orders = $ws->getOrders(
        customerName => ...
        createDateStart => ...
    );

[http://www.shipstation.com/developer-api/#/reference/orders/orders/get](http://www.shipstation.com/developer-api/#/reference/orders/orders/get)

## getOrder

    my $order = $ws->getOrder($orderId);

[http://www.shipstation.com/developer-api/#/reference/orders/order/get-order](http://www.shipstation.com/developer-api/#/reference/orders/order/get-order)

## getProducts

    my $products = $ws->getProducts(
        sku => ...
    );

[http://www.shipstation.com/developer-api/#/reference/products/products/get](http://www.shipstation.com/developer-api/#/reference/products/products/get)

## getShipments

    my $shipments = $ws->getShipments(
        orderId => ...
    );

[http://www.shipstation.com/developer-api/#/reference/shipments/shipments/get](http://www.shipstation.com/developer-api/#/reference/shipments/shipments/get)

## getStores

    my $stores = $ws->getStores(
        showInactive => 1,
    );

[http://www.shipstation.com/developer-api/#/reference/stores](http://www.shipstation.com/developer-api/#/reference/stores)

## getWarehouses

    my $warehouses = $ws->getWarehouses();

[http://www.shipstation.com/developer-api/#/reference/warehouses/warehouses/get](http://www.shipstation.com/developer-api/#/reference/warehouses/warehouses/get)

## createOrder

    my $order = $ws->createOrder({
      "orderNumber" => "TEST-ORDER-API-DOCS",
      "orderKey" => "0f6bec18-3e89-4771-83aa-f392d84f4c74",
      "orderDate" => "2015-06-29T08:46:27.0000000",
      "paymentDate" => "2015-06-29T08:46:27.0000000",
      "orderStatus" => "awaiting_shipment",
      "customerUsername" => 'headhoncho@whitehouse.gov',
      "customerEmail" => 'headhoncho@whitehouse.gov',
      "billTo" => {
        "name" => "The President",
        "company" => undef,
        "street1" => undef,
        "street2" => undef,
        "street3" => undef,
        "city" => undef,
        "state" => undef,
        "postalCode" => undef,
        "country" => undef,
        "phone" => undef,
        "residential" => undef
      },
      "shipTo" => {
        "name" => "The President",
        "company" => "US Govt",
        "street1" => "1600 Pennsylvania Ave",
        "street2" => "Oval Office",
        "street3" => undef,
        "city" => "Washington",
        "state" => "DC",
        "postalCode" => "20500",
        "country" => "US",
        "phone" => "555-555-5555",
        "residential" => 1
      },
      "items" => [
        {
          "lineItemKey" => "vd08-MSLbtx",
          "sku" => "ABC123",
          "name" => "Test item #1",
          "imageUrl" => undef,
          "weight" => {
            "value" => 24,
            "units" => "ounces"
          },
          "quantity" => 2,
          "unitPrice" => 99.99,
          "warehouseLocation" => "Aisle 1, Bin 7",
          "options" => [
            {
              "name" => "Size",
              "value" => "Large"
            }
          ],
          "adjustment" => 0
        },
        {
          "lineItemKey" => undef,
          "sku" => "DISCOUNT CODE",
          "name" => "10% OFF",
          "imageUrl" => undef,
          "weight" => {
            "value" => 0,
            "units" => "ounces"
          },
          "quantity" => 1,
          "unitPrice" => -20.55,
          "warehouseLocation" => undef,
          "options" => [],
          "adjustment" => 1
        }
      ],
      "amountPaid" => 218.73,
      "taxAmount" => 5,
      "shippingAmount" => 10,
      "customerNotes" => "Thanks for ordering!",
      "internalNotes" => "Customer called and would like to upgrade shipping",
      "gift" => 1,
      "giftMessage" => "Thank you!",
      "paymentMethod" => "Credit Card",
      "requestedShippingService" => "Priority Mail",
      "carrierCode" => "fedex",
      "serviceCode" => "fedex_2day",
      "packageCode" => "package",
      "confirmation" => "delivery",
      "shipDate" => "2015-07-02",
      "weight" => {
        "value" => 25,
        "units" => "ounces"
      },
      "dimensions" => {
        "units" => "inches",
        "length" => 7,
        "width" => 5,
        "height" => 6
      },
      "insuranceOptions" => {
        "provider" => "carrier",
        "insureShipment" => 1,
        "insuredValue" => 200
      },
      "internationalOptions" => {
        "contents" => undef,
            "customsItems" => undef
      },
      "advancedOptions" => {
        "warehouseId" => 0,
        "nonMachinable" => 0,
        "saturdayDelivery" => 0,
        "containsAlcohol" => 0,
        "storeId" => 0,
        "customField1" => "Custom data",
        "customField2" => "Per UI settings, this information",
        "customField3" => "can appear on some carrier's shipping labels",
        "source" => "Webstore"
      }
    });

## deleteOrder

    my $is_success = $ws->deleteOrder($OrderID);

## request

    my $data = $ws->request('customers');
    my $data = $ws->request('warehouses');

internal use

# AUTHOR

Fayland Lam <fayland@gmail.com>

# COPYRIGHT

Copyright 2014- Fayland Lam

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO
