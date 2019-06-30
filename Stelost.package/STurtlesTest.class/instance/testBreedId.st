tests-accessing
testBreedId
	| ts |
	ts := STurtles new.
	self assert: ts breedId isNil.
	ts breedId: 3.
	self assert: ts breedId equals: 3.
	ts breedId: 4.
	self assert: ts breedId equals: 4.