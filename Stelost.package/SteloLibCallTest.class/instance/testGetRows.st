test
testGetRows
	| c |
	c := SteloLibCall new.
	self assert: c getRows equals: self defaultOrder.
	c createPatch: 11.
	self assert: c getRows equals: 11.