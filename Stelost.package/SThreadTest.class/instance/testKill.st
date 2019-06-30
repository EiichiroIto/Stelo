tests-turtle instructions
testKill
	| w e s |
	w := SMicroWorld new.
	w create: 3 turtles: 2.
	e := SThread microworld: w.
	e forBreedNo: 3 index: 1.
	e codes: #(1 2 3 4).
	s := e stack size.
	self assert: ((w breedsOf: 3) aliveAt: 1).
	e push: 3.
	e push: 1.
	e kill.
	self assert: e stack size equals: s.
	self assert: ((w breedsOf: 3) aliveAt: 1) not.
	self assert: e pc equals: e codes size + 1.