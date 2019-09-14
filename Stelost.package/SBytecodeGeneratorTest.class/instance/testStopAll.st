tests-control ops
testStopAll
	| w b t |
	w := self newWorld.
	w create: 3 turtles: 1.
	b := SBytecodeGenerator new.
	b stopAll.
	b die.
	self assert: (w flag: STurtleVarId aliveFlagNo breed: 3 at: 1).
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	t execute: 1.
	self assert: (w flag: STurtleVarId aliveFlagNo breed: 3 at: 1).
	self assert: t isTerminated.