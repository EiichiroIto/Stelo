tests-observer ops
testTurtlesCount
	| w b t |
	w := self newWorld.
	w createPatch: 3.
	w create: 3 turtles: 2.
	w patches var: SPatchVarId colorVarNo at: 1 put: 3.
	b := SBytecodeGenerator new.
	b turtlesCount: 3.
	self assert: (w var: SPatchVarId colorVarNo breed: 2 at: 1) equals: 3.
	self assert: w patches size equals: 9.
	self assert: (w breedOf: 3) countAlive equals: 2.
	t := SThread sworld: w.
	t forObserver.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 2