tests-color ops
testSetColorTo
	| w b t |
	w := self newWorld.
	w createPatch: 3.
	w create: 3 turtles: 1.
	w
		var: STurtleVarId colorVarNo
		breed: 3
		at: 1
		put: SColorList red.
	w
		var: STurtleVarId colorVarNo
		breed: 3
		at: 2
		put: SColorList red.
	self
		assert: (w var: STurtleVarId colorVarNo breed: 3 at: 1)
		equals: SColorList red.
	self
		assert: (w var: STurtleVarId colorVarNo breed: 3 at: 2)
		equals: SColorList red.
	self
		assert: (w var: SPatchVarId colorVarNo breed: 2 at: 1)
		equals: SColorList black.
	self
		assert: (w var: SPatchVarId colorVarNo breed: 2 at: 2)
		equals: SColorList black.
	b := SBytecodeGenerator new.
	b setColorTo: SColorList yellow.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	t execute: 1.
	self
		assert: (w var: STurtleVarId colorVarNo breed: 3 at: 1)
		equals: SColorList yellow.
	self
		assert: (w var: STurtleVarId colorVarNo breed: 3 at: 2)
		equals: SColorList red.
	t := SThread sworld: w.
	t forPatchId: 2.
	t codes: b code.
	t execute: 1.
	self
		assert: (w var: SPatchVarId colorVarNo breed: 2 at: 1)
		equals: SColorList black.
	self
		assert: (w var: SPatchVarId colorVarNo breed: 2 at: 2)
		equals: SColorList yellow