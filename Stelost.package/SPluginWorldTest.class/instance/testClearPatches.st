test
testClearPatches
	| c x |
	c := SPluginWorld new.
	c createPatch: 10.
	x := c var: STurtleVarId colorVarNo breed: 2 at: 1.
	self assert: x equals: 0.
	c var: STurtleVarId colorVarNo breed: 2 at: 1 put: 10.
	x := c var: STurtleVarId colorVarNo breed: 2 at: 1.
	self assert: x equals: 10.
	c clearPatches.
	x := c var: STurtleVarId colorVarNo breed: 2 at: 1.
	self assert: x equals: 0.