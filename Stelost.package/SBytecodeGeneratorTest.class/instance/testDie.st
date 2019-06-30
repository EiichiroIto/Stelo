tests-misc ops
testDie
	| w b t |
	w := SMicroWorld new.
	w createPatchOrder: 3.
	w create: 3 turtles: 2.
	b := SBytecodeGenerator new.
	b die.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	self assert: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 1).
	self assert: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 2).
	t execute: b code.
	self deny: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 1).
	self assert: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 2).
	t := SThread microworld: w.
	t forPatchId: 2.
	t execute: b code.
	self deny: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 1).
	self assert: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 2)