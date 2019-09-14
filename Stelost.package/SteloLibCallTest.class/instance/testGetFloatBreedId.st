test
testGetFloatBreedId
	| c x |
	c := SteloLibCall new.
	x := c getFloat: SObserverVarId widthVarNo breed: SBreedId observerBreedNo id: 1.
	self assert: x equals: c getRows.