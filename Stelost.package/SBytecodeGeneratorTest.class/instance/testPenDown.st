tests-turtle  ops
testPenDown
	| w b t r |
	w := self newWorld.
	w create: 3 turtles: 1.
	w
		var: STurtleVarId flagVarNo
		breed: 3
		at: 1
		put: 1.
	b := SBytecodeGenerator new.
	b penDown: true.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	t execute: 1.
	r := w var: STurtleVarId flagVarNo breed: 3 at: 1.
	self assert: r equals: 1 + (1 << STurtleVarId penDownFlagNo).
	b := SBytecodeGenerator new.
	b penDown: false.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	t execute: 1.
	r := w var: STurtleVarId flagVarNo breed: 3 at: 1.
	self assert: r equals: 1