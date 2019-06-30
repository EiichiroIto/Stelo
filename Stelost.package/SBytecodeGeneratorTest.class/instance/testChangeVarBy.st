tests-variable ops
testChangeVarBy
	| w vid b t |
	w := SMicroWorld new.
	w create: 3 turtles: 2.
	vid := (w breedsOf: 3) addVariable: 'a'.
	w
		var: vid
		breedNo: 3
		at: 1
		put: 5.
	b := SBytecodeGenerator new.
	b changeVar: vid by: 10.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t execute: b code.
	self assert: (w var: vid breedNo: 3 at: 1) equals: 15.
	self assert: (w var: vid breedNo: 3 at: 2) equals: 0.
	b := SBytecodeGenerator new.
	b changeVar: vid by: -1.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 2.
	t execute: b code.
	self assert: (w var: vid breedNo: 3 at: 1) equals: 15.
	self assert: (w var: vid breedNo: 3 at: 2) equals: -1