test
testSizeOf
	| c |
	c := SteloLibCall new.
	self assert: (c sizeOf: 2) equals: self defaultPatchSize.
	c createPatch: 11.
	self assert: (c sizeOf: 2) equals: 121.