test
testClearPatches
	| c x |
	c := SteloLibCall new.
	c createPatch: 10.
	x := c getByte: STurtleVarId colorVarNo breed: 2 id: 1.
	self assert: x equals: 0.
	c setByte: STurtleVarId colorVarNo breed: 2 id: 1 value: 10.
	x := c getByte: STurtleVarId colorVarNo breed: 2 id: 1.
	self assert: x equals: 10.
	c clearPatches.
	x := c getByte: STurtleVarId colorVarNo breed: 2 id: 1.
	self assert: x equals: 0.