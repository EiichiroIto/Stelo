tests-private
testSetupBreeds
	| w |
	w := SMicroWorld new.
	self assert: w privBreeds isArray.
	self assert: (w privBreeds at: 1) equals: w.
	self assert: (w privBreeds at: 2) class equals: SPatches.
	self assert: (w privBreeds at: 3) class equals: STurtles.