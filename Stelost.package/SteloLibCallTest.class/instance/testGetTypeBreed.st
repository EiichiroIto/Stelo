test
testGetTypeBreed
	| c t |
	c := SteloLibCall new.
	c setupBreed: SBreedId turtleBreedNo.
	t := c getType: STurtleVarId colorVarNo breed: SBreedId turtleBreedNo.
	self assert: t equals: SteloLibCall byte.
	t := c getType: STurtleVarId flagVarNo breed: SBreedId turtleBreedNo.
	self assert: t equals: SteloLibCall byte.
	t := c getType: STurtleVarId xVarNo breed: SBreedId turtleBreedNo.
	self assert: t equals: SteloLibCall float.
	t := c getType: STurtleVarId yVarNo breed: SBreedId turtleBreedNo.
	self assert: t equals: SteloLibCall float.
	t := c getType: STurtleVarId headingVarNo breed: SBreedId turtleBreedNo.
	self assert: t equals: SteloLibCall float.
	t := c getType: SPatchVarId colorVarNo breed: SBreedId patchBreedNo.
	self assert: t equals: SteloLibCall byte.
	t := c getType: SPatchVarId xVarNo breed: SBreedId patchBreedNo.
	self assert: t equals: SteloLibCall computedFloat.
	t := c getType: SPatchVarId yVarNo breed: SBreedId patchBreedNo.
	self assert: t equals: SteloLibCall computedFloat.
	t := c getType: SPatchVarId screenVarNo breed: SBreedId patchBreedNo.
	self assert: t equals: SteloLibCall byte.