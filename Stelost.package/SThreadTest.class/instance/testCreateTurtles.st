tests-observer ops
testCreateTurtles
	| w e s |
	w := self newWorld.
	e := SThread sworld: w.
	s := e stack size.
	e push: 20.
	e push: 3.
	self assert: (w breedOf: 3) countAlive equals: 0.
	e createTurtles.
	self assert: e stack size equals: s.
	self assert: (w breedOf: 3) countAlive equals: 20.