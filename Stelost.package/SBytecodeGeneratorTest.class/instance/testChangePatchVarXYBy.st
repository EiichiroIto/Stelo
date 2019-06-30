tests-patch ops
testChangePatchVarXYBy
	| w b vid t |
	w := SMicroWorld new.
	w createPatchOrder: 3.
	w create: 3 turtles: 1.
	vid := w patches addVariable: 'a'.
	w patches var: vid at: 2 put: 1.
	w patches var: vid at: 5 put: 2.
	b := SBytecodeGenerator new.
	b
		changePatchVar: vid
		x: 0
		y: 0
		by: 5.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t execute: b code.
	self assert: (w patches var: vid at: 2) equals: 1.
	self assert: (w patches var: vid at: 5) equals: 7.
	w y: 3 at: 1 put: -1.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t execute: b code.
	self assert: (w patches var: vid at: 2) equals: 6.
	self assert: (w patches var: vid at: 5) equals: 7