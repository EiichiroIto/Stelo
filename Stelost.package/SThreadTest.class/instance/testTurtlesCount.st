tests-observer ops
testTurtlesCount
	| w t |
	w := SMicroWorld new.
	w create: 3 turtles: 2.
	w create: w newBreed turtles: 3.
	t := SThread microworld: w.
	t push: 3.
	t turtlesCount.
	self assert: t pop equals: 2.
	t push: 4.
	t turtlesCount.
	self assert: t pop equals: 3.