tests
testCountAllTurtles
	| w |
	w := SMicroWorld new.
	w create: 3 turtles: 10.
	self assert: w countAllTurtles equals: 10.
	w newBreed.
	w create: 4 turtles: 15.
	self assert: w countAllTurtles equals: 25.