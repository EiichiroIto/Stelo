tests-accessing
testClear
	| ts |
	ts := STurtles new breedId: SBreedId turtleBreedNo.
	ts create: 100.
	self assert: ts count equals: 100.
	ts clear.
	self assert: ts count equals: 0.