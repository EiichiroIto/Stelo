tests-turtle  ops
testForward
	| w b t |
	w := self newWorld.
	w create: 3 turtles: 2.
	self assert: (w var: STurtleVarId xVarNo breed: 3 at: 1) equals: 0.
	self assert: (w var: STurtleVarId yVarNo breed: 3 at: 1) equals: 0.
	self assert: (w var: STurtleVarId xVarNo breed: 3 at: 2) equals: 0.
	self assert: (w var: STurtleVarId yVarNo breed: 3 at: 2) equals: 0.
	(w breedOf: 3) headingAt: 1 put: 45.
	b := SBytecodeGenerator new.
	b forward: 2 sqrt.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	t execute: 1.
	self assert: (w var: STurtleVarId xVarNo breed: 3 at: 1) equals: 1.
	self assert: (w var: STurtleVarId yVarNo breed: 3 at: 1) equals: 1.
	self assert: (w var: STurtleVarId xVarNo breed: 3 at: 2) equals: 0.
	self assert: (w var: STurtleVarId yVarNo breed: 3 at: 2) equals: 0