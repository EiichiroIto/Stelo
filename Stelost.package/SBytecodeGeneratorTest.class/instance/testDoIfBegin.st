tests-control ops
testDoIfBegin
	| w b t i |
	w := self newWorld.
	w create: 3 turtles: 1.
	b := SBytecodeGenerator new.
	b appendValue: false.
	i := b doIfBegin: nil.
	b die.
	b doIfEnd: i.
	self assert: (w flag: STurtleVarId aliveFlagNo breed: 3 at: 1).
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	t execute: 1.
	self assert: (w flag: STurtleVarId aliveFlagNo breed: 3 at: 1).
	b := SBytecodeGenerator new.
	b appendValue: true.
	i := b doIfBegin: nil.
	b die.
	b doIfEnd: i.
	self assert: (w flag: STurtleVarId aliveFlagNo breed: 3 at: 1).
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	t execute: 1.
	self deny: (w flag: STurtleVarId aliveFlagNo breed: 3 at: 1)