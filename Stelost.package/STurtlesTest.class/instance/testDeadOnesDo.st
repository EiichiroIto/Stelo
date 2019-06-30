tests-enumerating
testDeadOnesDo
	| ts ret |
	ts := STurtles new breedId: SBreedId turtleBreedNo.
	ts clear.
	ts create: 5.
	self assert: ts count	equals: 5.
	ret := 0.
	ts deadOnesDo: [ :each | ret := ret + 1 ].
	self assert: ret	equals: (ts privVariables elementSize - 5).