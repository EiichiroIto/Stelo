tests-turtle  ops
testSetXpos
	| w b t |
	w := SMicroWorld new.
	w create: 3 turtles: 2.
	self assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 1) equals: 0.
	self assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 2) equals: 0.
	b := SBytecodeGenerator new.
	b setXpos: 3.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t execute: b code.
	self assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 1) equals: 3.
	self assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 2) equals: 0