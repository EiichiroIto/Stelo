tests-patch ops
testSetPatchVarXYTo
	| w b vid t |
	w := SMicroWorld new.
	w createPatchOrder: 3.
	w create: 3 turtles: 1.
	vid := w patches addVariable: 'a'.
	self assert: (w patches var: vid at: 2) equals: 0.
	self assert: (w patches var: vid at: 5) equals: 0.
	b := SBytecodeGenerator new.
	b
		setPatchVar: vid
		x: 0
		y: 0
		to: 5.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t execute: b code.
	self assert: (w patches var: vid at: 2) equals: 0.
	self assert: (w patches var: vid at: 5) equals: 5.
	w y: 3 at: 1 put: -1.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t execute: b code.
	self assert: (w patches var: vid at: 2) equals: 5.
	self assert: (w patches var: vid at: 5) equals: 5