tests-observer ops
testClearGraphics
	| w b t |
	w := self newWorld.
	w createPatch: 3.
	w create: 3 turtles: 2.
	w
		var: SPatchVarId colorVarNo
		breed: 2
		at: 1
		put: 3.
	b := SBytecodeGenerator new.
	b clearGraphics.
	self
		assert: (w var: SPatchVarId colorVarNo breed: 2 at: 1)
		equals: 3.
	self assert: w patches size equals: 9.
	self assert: (w breedOf: 3) countAlive equals: 2.
	t := SThread sworld: w.
	t forObserver.
	t codes: b code.
	t execute: 1.
	self
		assert: (w var: SPatchVarId colorVarNo breed: 2 at: 1)
		equals: 0.
	self assert: w patches size equals: 9.
	self assert: (w breedOf: 3) countAlive equals: 2