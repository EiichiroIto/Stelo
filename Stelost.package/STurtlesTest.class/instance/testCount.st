tests-accessing
testCount
	| ts |
	ts := STurtles new breedId: SBreedId turtleBreedNo.
	ts create: 10.
	self assert: ts count equals: 10.
	ts aliveAt: 4 put: false.
	ts aliveAt: 8 put: false.
	self assert: ts count equals: 8.