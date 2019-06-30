tests-accessing variable
testAliveAtPut
	| ts |
	ts := STurtles new breedId: SBreedId turtleBreedNo.
	ts clear.
	ts create: 3.
	self assert: ts count	equals: 3.
	ts aliveAt: 1 put: false.
	ts aliveAt: 2 put: false.
	self assert: ts count	equals: 1.
	ts aliveAt: 2 put: true.
	self assert: ts count	equals: 2.