tests-control ops
testDoIfElse
	| w b t i |
	w := SMicroWorld new.
	w create: 3 turtles: 2.
	w
		var: STurtleVarId colorVarNo
		breedNo: 3
		at: 1
		put: 0.
	w
		var: STurtleVarId colorVarNo
		breedNo: 3
		at: 2
		put: 0.
	b := SBytecodeGenerator new.
	b appendValue: false.
	i := b doIfBegin: nil.
	b die.
	i := b doIfElse: i.
	b setVar: STurtleVarId colorVarNo to: 15.
	b doIfEnd: i.
	self
		assert: (w var: STurtleVarId colorVarNo breedNo: 3 at: 1)
		equals: 0.
	self assert: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 1).
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t execute: b code.
	self
		assert: (w var: STurtleVarId colorVarNo breedNo: 3 at: 1)
		equals: 15.
	self assert: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 1).
	b := SBytecodeGenerator new.
	b appendValue: true.
	i := b doIfBegin: nil.
	b die.
	i := b doIfElse: i.
	b setVar: STurtleVarId colorVarNo to: 15.
	b doIfEnd: i.
	self
		assert: (w var: STurtleVarId colorVarNo breedNo: 3 at: 2)
		equals: 0.
	self assert: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 2).
	t := SThread microworld: w.
	t forBreedNo: 3 index: 2.
	t execute: b code.
	self
		assert: (w var: STurtleVarId colorVarNo breedNo: 3 at: 2)
		equals: 0.
	self deny: (w var: STurtleVarId aliveVarNo breedNo: 3 at: 2)