tests-accessing variable
testAliveAt
	| ts |
	ts := STurtles new breedId: SBreedId turtleBreedNo.
	ts clear.
	ts create: 2.
	self assert: ts count	equals: 2.
	ts aliveAt: 1 put: false.
	self assert: ts count	equals: 1.