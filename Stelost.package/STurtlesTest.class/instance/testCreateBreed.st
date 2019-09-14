tests-command
testCreateBreed
	| ts |
	ts := STurtles new breedNo: SBreedId turtleBreedNo.
	self assert: ts countAlive equals: 0.
	ts create: 10.
	self assert: ts countAlive equals: 10.