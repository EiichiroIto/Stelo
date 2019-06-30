tests-turtle  ops
testTurn
	| w b t |
	w := SMicroWorld new.
	w create: 3 turtles: 2.
	w
		var: STurtleVarId headingVarNo
		breedNo: 3
		at: 1
		put: 5.
	w
		var: STurtleVarId headingVarNo
		breedNo: 3
		at: 2
		put: 5.
	b := SBytecodeGenerator new.
	b turn: -15.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 2.
	t execute: b code.
	self
		assert: (w var: STurtleVarId headingVarNo breedNo: 3 at: 1)
		equals: 5.
	self
		assert: (w var: STurtleVarId headingVarNo breedNo: 3 at: 2)
		equals: 350