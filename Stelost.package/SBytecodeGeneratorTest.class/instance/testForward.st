tests-turtle  ops
testForward
	| w b t |
	w := SMicroWorld new.
	w create: 3 turtles: 2.
	self assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 1) equals: 0.
	self assert: (w var: STurtleVarId yVarNo breedNo: 3 at: 1) equals: 0.
	self assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 2) equals: 0.
	self assert: (w var: STurtleVarId yVarNo breedNo: 3 at: 2) equals: 0.
	(w breedsOf: 3) headingAt: 1 put: 45.
	b := SBytecodeGenerator new.
	b forward: 2 sqrt.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t execute: b code.
	self assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 1) equals: 1.
	self assert: (w var: STurtleVarId yVarNo breedNo: 3 at: 1) equals: 1.
	self assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 2) equals: 0.
	self assert: (w var: STurtleVarId yVarNo breedNo: 3 at: 2) equals: 0