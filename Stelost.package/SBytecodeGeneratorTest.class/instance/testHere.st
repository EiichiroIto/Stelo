tests-patch ops
testHere
	| w b t |
	w := self newWorld.
	w createPatch: 3.
	w create: 3 turtles: 1.

"1 2 3
 4 5 6
 7 8 9"

	w var: STurtleVarId xVarNo breed: SBreedId turtleBreedNo at: 1 put: 0.
	w var: STurtleVarId yVarNo breed: SBreedId turtleBreedNo at: 1 put: 0.

	b := SBytecodeGenerator new.
	b here.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 5.

	w var: STurtleVarId xVarNo breed: SBreedId turtleBreedNo at: 1 put: 1.

	b := SBytecodeGenerator new.
	b here.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 6.

	w var: STurtleVarId yVarNo breed: SBreedId turtleBreedNo at: 1 put: -1.

	b := SBytecodeGenerator new.
	b here.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 3.