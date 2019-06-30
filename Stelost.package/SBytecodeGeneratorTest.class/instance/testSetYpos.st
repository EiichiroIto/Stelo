tests-turtle  ops
testSetYpos
	| w b t |
	w := SMicroWorld new.
	w create: 3 turtles: 2.
	self assert: (w var: STurtleVarId yVarNo breedNo: 3 at: 1) equals: 0.
	self assert: (w var: STurtleVarId yVarNo breedNo: 3 at: 2) equals: 0.
	b := SBytecodeGenerator new.
	b setYpos: 5.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 2.
	t execute: b code.
	self assert: (w var: STurtleVarId yVarNo breedNo: 3 at: 1) equals: 0.
	self assert: (w var: STurtleVarId yVarNo breedNo: 3 at: 2) equals: 5