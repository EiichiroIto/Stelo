test
testMaxBreedNo
	| c |
	c := SteloLibCall new.
	self assert: c maxBreedNo equals: 2.
	c setupBreed: 3.
	self assert: c maxBreedNo equals: 3.