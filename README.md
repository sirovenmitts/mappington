# Mappington
## Maps from Google, stat!

## Quick Start

The easiest way to get started with Mappington is to use the module method #uri_for. Just pass in an address or coordinate, and you'll receive a URI pointing to a Google map centered on that point. Additionally a marker is placed on the point.

    require 'mappington'
    
    Mappington.uri_for 'Fortress of Solitude'

## Addresses and Coordinates

Mappington knows how to talk addresses and coordinates. Addresses are strings, or things that respond to #to_s. Coordinates are Arrays.

## Setting up a Map

A Map will generate a URI pointing to a Google map for you. There are only 2 things that a Map must know:

* The Map must know what area of the world you want to draw. You can specify this in one of 3 ways:
  * Provide a point to center the map on and a zoom level.
  * Place at least one marker.
  * Draw at least one path.
* The Map must know how big you want the final image to be.

Google will ensure that all paths and markers are shown. Also, don't worry too much if you miss one of these: Map will throw an error, so you'll know right away if something is messed up.

### Setting the output image size

You can (must) tell Map how big you'd like the final image to be like so:

    map = Mappington::Map.new :size => [320, 240]

Note: Google only supports images up to 640x640 unless you are a Google Premier customer (you pay them). Mappington has no support for indicating if you have Premier status.

### Specifying a center and zoom level

    map = Mappington::Map.new :center_on => 'the Bat Cave', :zoom_level => 21, :size => [320, 240]

From then on you can access the center of the map via

    map.center
    # the Bat Cave

## Adding markers and paths

You can pass markers or paths into Map's initializer, but most of the time the code is easier to read if you just push them onto the map later. Start by making a map:

    map = Mappington::Map.new :size => [320, 240]

Then later when you've got all your markers or paths setup:

    map.markers << Mappington::Marker.new(:at => "Tony Stark's house")
    
    path = Mappington::Path.new
    path.points << "Tony Stark's house"
    path.points << 'Metropolis'
    
    map.paths << path

As you can see, paths are a litte more involved than markers. One thing to note about Markers: you can access and change the point of a marker after initialization by accessing #point:

    marker = Mappington::Marker.new :at => [0, 0]
    marker.point
    # [0, 0]

Note: Google truncates URIs longer than 2048 characters and doesn't warn you that this is happening. Mappington will raise an error when it detects an excessively long URI.

## Overriding default values using a config block

You can't do this yet, but it's my goal for 2.0

## History

This library was written from scratch after I spent a good long while revamping Brent Sowers' GoogleStaticMap. The two libraries accomplish the same goal (generating a URI pointing to a Google Map) but go about it in different ways. Additionally, Brent's library supports downloading the image and returning the bytes. If you are looking for a more full featured library check [his out](github.com/brentsowers1/googlestaticmap).

## Contribute

1) Fork the library
2) Make some changes
3) Create a pull request

Alternatively, just email me or open an issue on github. I'd be happy to support more features if there is demand for them.