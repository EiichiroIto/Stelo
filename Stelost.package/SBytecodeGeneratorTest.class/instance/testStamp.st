tests-color ops
testStamp
	| w b t |
	w := SMicroWorld new.
	w createPatchOrder: 3.
	w create: 3 turtles: 1.
	w
		var: STurtleVarId colorVarNo
		breedNo: 3
		at: 1
		put: 15.
	self
		assert: (w var: SPatchVarId colorVarNo breedNo: 2 at: 5)
		equals: 0.
	self
		assert: (w var: SPatchVarId colorVarNo breedNo: 2 at: 6)
		equals: 0.
	b := SBytecodeGenerator new.
	b stamp.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t execute: b code.
	self
		assert: (w var: SPatchVarId colorVarNo breedNo: 2 at: 5)
		equals: 15.
	self
		assert: (w var: SPatchVarId colorVarNo breedNo: 2 at: 6)
		equals: 0.
	w x: 3 at: 1 put: 1.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t execute: b code.
	self
		assert: (w var: SPatchVarId colorVarNo breedNo: 2 at: 5)
		equals: 15.
	self
		assert: (w var: SPatchVarId colorVarNo breedNo: 2 at: 6)
		equals: 15