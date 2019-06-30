tests-command
testCreateBreed
	| ts |
	ts := STurtles new breedId: SBreedId turtleBreedNo.
	self assert: ts count equals: 0.
	ts create: 10.
	self assert: ts count equals: 10.