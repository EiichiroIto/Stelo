tests-turtle  ops
testTurn
	| w b t |
	w := self newWorld.
	w create: 3 turtles: 2.
	w
		var: STurtleVarId headingVarNo
		breed: 3
		at: 1
		put: 5.
	w
		var: STurtleVarId headingVarNo
		breed: 3
		at: 2
		put: 5.
	b := SBytecodeGenerator new.
	b turn: -15.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 2.
	t codes: b code.
	t execute: 1.
	self
		assert: (w var: STurtleVarId headingVarNo breed: 3 at: 1)
		equals: 5.
	self
		assert: (w var: STurtleVarId headingVarNo breed: 3 at: 2)
		equals: 350