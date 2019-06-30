tests-accessing
testDefaultColor
	| ts |
	ts := STurtles new breedId: SBreedId turtleBreedNo.
	self assert: (ts defaultColor between: 1 and: 140).