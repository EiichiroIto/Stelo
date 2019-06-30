tests-world instructions
testBroadcast
	| w e s |
	w := SMicroWorld new.
	e := SThread microworld: w.
	s := e stack size.
	e push: 10.
	self assert: w raisedEvents isEmpty.
	e broadcast.
	self assert: e stack size equals: s.
	self assert: w raisedEvents size equals: 1.
	self assert: (w raisedEvents includes: 10).