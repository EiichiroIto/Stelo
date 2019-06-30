tests-world instructions
testCreateTurtles
	| w e s |
	w := SMicroWorld new.
	e := SThread microworld: w.
	s := e stack size.
	e push: 20.
	e push: 3.
	self assert: (w breedsOf: 3) count equals: 0.
	e createTurtles.
	self assert: e stack size equals: s.
	self assert: (w breedsOf: 3) count equals: 20.