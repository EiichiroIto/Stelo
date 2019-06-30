tests-world instructions
testClearTurtles
	| w e s |
	w := SMicroWorld new.
	w create: 3 turtles: 10.
	e := SThread microworld: w.
	s := e stack size.
	self assert: (w breedsOf: 3) count equals: 10.
	e clearTurtles.
	self assert: (w breedsOf: 3) count equals: 0.
	self assert: e stack size equals: s.