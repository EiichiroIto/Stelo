tests-turtle ops
testHatch
	| w e s |
	w := SMicroWorld new.
	w create: 3 turtles: 1.
	e := SThread microworld: w.
	e forBreedNo: 3 index: 1.
	s := e stack size.
	self assert: (w breedsOf: 3) count equals: 1.
	self assert: ((w breedsOf: 3) aliveAt: 1).
	e hatch.
	self assert: (w breedsOf: 3) count equals: 2.
	self assert: ((w breedsOf: 3) aliveAt: 1).
	self assert: ((w breedsOf: 3) aliveAt: 2).
	self assert: e stack size equals: s.