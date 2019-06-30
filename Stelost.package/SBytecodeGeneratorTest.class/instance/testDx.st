tests-turtle  ops
testDx
	| w b t |
	w := SMicroWorld new.
	w createPatchOrder: 5.
	w create: 3 turtles: 2.
	(w breedsOf: 3) headingAt: 1 put: 45.
	(w breedsOf: 3) headingAt: 2 put: 60.
	b := SBytecodeGenerator new.
	b dx.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	self assert: (t evaluate: b code) closeTo: 45 degreeCos.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 2.
	self assert: (t evaluate: b code) closeTo: 60 degreeCos