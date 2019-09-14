test
testGetCols
	| c |
	c := SteloLibCall new.
	self assert: c getCols equals: self defaultOrder.
	c createPatch: 11.
	self assert: c getCols equals: 11.