tests-observer ops
testTurtlesCount
	| w t |
	w := self newWorld.
	w create: 3 turtles: 2.
	w create: w newBreed breedNo turtles: 3.
	t := SThread sworld: w.
	t push: 3.
	t turtlesCount.
	self assert: t pop equals: 2.
	t push: 4.
	t turtlesCount.
	self assert: t pop equals: 3.