tests-control ops
testDoIfBegin
	| w b t i |
	w := SMicroWorld new.
	w create: 3 turtles: 1.
	b := SBytecodeGenerator new.
	b appendValue: false.
	i := b doIfBegin: nil.
	b die.
	b doIfEnd: i.
	self assert: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 1).
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t execute: b code.
	self assert: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 1).
	b := SBytecodeGenerator new.
	b appendValue: true.
	i := b doIfBegin: nil.
	b die.
	b doIfEnd: i.
	self assert: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 1).
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t execute: b code.
	self deny: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 1)