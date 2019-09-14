test
testCountAllTurtles
	| w o |
	w := self newWorld.
	w create: 3 turtles: 10.
	o := SObserver new sworld: w.
	self assert: o countAllTurtles equals: 10.
	w newBreed.
	w create: 4 turtles: 15.
	self assert: o countAllTurtles equals: 25.