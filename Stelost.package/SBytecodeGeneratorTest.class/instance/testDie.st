tests-misc ops
testDie
	| w b t |
	w := self newWorld.
	w createPatch: 3.
	w create: 3 turtles: 2.
	b := SBytecodeGenerator new.
	b die.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	self assert: (w flag: STurtleVarId aliveFlagNo breed: 3 at: 1).
	self assert: (w flag: STurtleVarId aliveFlagNo breed: 3 at: 2).
	t codes: b code.
	t execute: 1.
	self deny: (w flag: STurtleVarId aliveFlagNo breed: 3 at: 1).
	self assert: (w flag: STurtleVarId aliveFlagNo breed: 3 at: 2).
	t := SThread sworld: w.
	t forPatchId: 2.
	t codes: b code.
	t execute: 1.
	self deny: (w flag: STurtleVarId aliveFlagNo breed: 3 at: 1).
	self assert: (w flag: STurtleVarId aliveFlagNo breed: 3 at: 2)