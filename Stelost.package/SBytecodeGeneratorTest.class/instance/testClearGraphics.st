tests-observer ops
testClearGraphics
	| w b t |
	w := SMicroWorld new.
	w createPatchOrder: 3.
	w create: 3 turtles: 2.
	w
		var: SPatchVarId colorVarNo
		breedNo: 2
		at: 1
		put: 3.
	b := SBytecodeGenerator new.
	b clearGraphics.
	self
		assert: (w var: SPatchVarId colorVarNo breedNo: 2 at: 1)
		equals: 3.
	self assert: w patches count equals: 9.
	self assert: (w breedsOf: 3) count equals: 2.
	t := SThread microworld: w.
	t forObserver.
	t execute: b code.
	self
		assert: (w var: SPatchVarId colorVarNo breedNo: 2 at: 1)
		equals: 0.
	self assert: w patches count equals: 9.
	self assert: (w breedsOf: 3) count equals: 2