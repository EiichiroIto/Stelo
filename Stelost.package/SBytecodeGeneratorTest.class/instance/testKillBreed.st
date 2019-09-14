tests-misc ops
testKillBreed
	| w b t |
	w := self newWorld.
	w createPatch: 3.
	w create: 3 turtles: 3.
	b := SBytecodeGenerator new.
	b kill: 2 breed: 3.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 3.
	self assert: (w flag: STurtleVarId aliveFlagNo breed: 3 at: 1).
	self assert: (w flag: STurtleVarId aliveFlagNo breed: 3 at: 2).
	self assert: (w flag: STurtleVarId aliveFlagNo breed: 3 at: 3).
	t codes: b code.
	t execute: 1.
	self assert: (w flag: STurtleVarId aliveFlagNo breed: 3 at: 1).
	self deny: (w flag: STurtleVarId aliveFlagNo breed: 3 at: 2).
	self assert: (w flag: STurtleVarId aliveFlagNo breed: 3 at: 3)