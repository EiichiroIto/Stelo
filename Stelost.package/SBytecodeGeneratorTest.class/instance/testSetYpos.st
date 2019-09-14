tests-turtle  ops
testSetYpos
	| w b t |
	w := self newWorld.
	w create: 3 turtles: 2.
	self assert: (w var: STurtleVarId yVarNo breed: 3 at: 1) equals: 0.
	self assert: (w var: STurtleVarId yVarNo breed: 3 at: 2) equals: 0.
	b := SBytecodeGenerator new.
	b setYpos: 5.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 2.
	t codes: b code.
	t execute: 1.
	self assert: (w var: STurtleVarId yVarNo breed: 3 at: 1) equals: 0.
	self assert: (w var: STurtleVarId yVarNo breed: 3 at: 2) equals: 5