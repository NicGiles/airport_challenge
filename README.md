Airport Challenge
=================

This is my attempt at the Makers Airport Challenge in Ruby.

Setup
----

Here are the steps required in order to complete the user stories found below:

1. Clone this repository.
2. Open directory in terminal
3. Run 'bundle'
4. Open IRB
5. Require AirTrafficController

Feature Test
----

Open IRB and follow these steps:

:001 > require './lib/AirTrafficController'

Create a new Airport
:002 > heathrow = AirTrafficController.new

=> #<AirTrafficController:0x00007fc49c157b48 @capacity=8, @weather=#<Weather:0x00007fc49c157b20>, @available_planes=[]>

A Plane enters Heathrow's airspace

:003 > plane = Plane.new
 => #<Plane:0x00007fc49b1760a8 @in_the_air=true>
 

Instruct Plane to land & receive confirmation

:004 > heathrow.land_plane_when_safe(plane)
 => "Plane is in the hanger"


Instruct Plane to take off & receive confirmation

 :005 > heathrow.take_off_when_safe(plane)
 => "Plane is in the air"


Prevent too many planes from landing

 :006 > 8.times{ heathrow.land_plane_when_safe(plane) }

RuntimeError (Sorry boss, no room in the inn)


AirTrafficController will check the conditions and prevent planes from landing or taking off in nasty weather.
This probability of nasty weather is 20%.
In the below example the conditions were fine for the first two planes but by the time the third plane tried to take off the clouds had rolled in and the AirTraffic systems prevented takeoff.

2.5.0 :007 > heathrow.take_off_when_safe(plane)
 => "Plane is in the air"
2.5.0 :008 > heathrow.take_off_when_safe(plane)
 => "Plane is in the air"
2.5.0 :009 > heathrow.take_off_when_safe(plane)
RuntimeError (You fly boys, you crack me up)

User stories
-----
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
