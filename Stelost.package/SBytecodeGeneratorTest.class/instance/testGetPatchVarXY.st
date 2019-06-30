tests-patch ops
testGetPatchVarXY
	| w b vid t ret |
	w := SMicroWorld new.
	w createPatchOrder: 3.
	w create: 3 turtles: 1.
	vid := w patches addVariable: 'a'.
	w patches var: vid at: 5 put: 4.
	w patches var: vid at: 2 put: 8.
	b := SBytecodeGenerator new.
	ret := b getPatchVar: vid x: 0 y: 0.
	self assert: ret isNil.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	self assert: (t evaluate: b code) equals: 4.
	w y: 3 at: 1 put: -1.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	self assert: (t evaluate: b code) equals: 8