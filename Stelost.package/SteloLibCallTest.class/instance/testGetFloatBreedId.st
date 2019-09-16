test
testGetFloatBreedId
	| c x |
	c := SteloLibCall new.
	c createPatch: 10.
	x := c getFloat: SObserverVarId widthVarNo breed: SBreedId observerBreedNo id: 1.
	self assert: x equals: 10.