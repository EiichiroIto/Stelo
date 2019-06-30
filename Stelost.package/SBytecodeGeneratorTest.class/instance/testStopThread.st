tests-control ops
testStopThread
	| w b t |
	w := SMicroWorld new.
	w create: 3 turtles: 1.
	b := SBytecodeGenerator new.
	b stopThread.
	b die.
	self assert: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 1).
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t execute: b code.
	self assert: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 1)