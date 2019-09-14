tests-color ops
testStamp
	| w b t |
	w := self newWorld.
	w createPatch: 3.
	w create: 3 turtles: 1.
	w
		var: STurtleVarId colorVarNo
		breed: 3
		at: 1
		put: 15.
	self
		assert: (w var: SPatchVarId colorVarNo breed: 2 at: 5)
		equals: 0.
	self
		assert: (w var: SPatchVarId colorVarNo breed: 2 at: 6)
		equals: 0.
	b := SBytecodeGenerator new.
	b stamp.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	t execute: 1.
	self
		assert: (w var: SPatchVarId colorVarNo breed: 2 at: 5)
		equals: 15.
	self
		assert: (w var: SPatchVarId colorVarNo breed: 2 at: 6)
		equals: 0.
	w x: 3 at: 1 put: 1.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	t execute: 1.
	self
		assert: (w var: SPatchVarId colorVarNo breed: 2 at: 5)
		equals: 15.
	self
		assert: (w var: SPatchVarId colorVarNo breed: 2 at: 6)
		equals: 15