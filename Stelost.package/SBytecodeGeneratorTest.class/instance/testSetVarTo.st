tests-variable ops
testSetVarTo
	| w vid b t |
	w := SMicroWorld new.
	w create: 3 turtles: 2.
	vid := (w breedsOf: 3) addVariable: 'a'.
	self assert: (w var: vid breedNo: 3 at: 1) equals: 0.
	self assert: (w var: vid breedNo: 3 at: 2) equals: 0.
	b := SBytecodeGenerator new.
	b setVar: vid to: 10.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t execute: b code.
	self assert: (w var: vid breedNo: 3 at: 1) equals: 10.
	self assert: (w var: vid breedNo: 3 at: 2) equals: 0.