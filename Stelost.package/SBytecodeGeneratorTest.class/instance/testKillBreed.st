tests-misc ops
testKillBreed
	| w b t |
	w := SMicroWorld new.
	w createPatchOrder: 3.
	w create: 3 turtles: 3.
	b := SBytecodeGenerator new.
	b kill: 2 breed: 3.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 3.
	self assert: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 1).
	self assert: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 2).
	self assert: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 3).
	t execute: b code.
	self assert: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 1).
	self deny: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 2).
	self assert: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 3)