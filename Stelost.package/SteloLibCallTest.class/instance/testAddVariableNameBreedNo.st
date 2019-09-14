test
testAddVariableNameBreedNo
	| c x |
	c := SteloLibCall new.
	x := c addVariable: 'abc' var: 10 breed: SBreedId patchBreedNo.
	self assert: x.
	x := c addVariable: 'abc' var: 10 breed: SBreedId patchBreedNo.
	self deny: x