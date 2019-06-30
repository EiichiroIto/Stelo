tests-variable ops
testGetVar
	| w vid b t ret |
	w := SMicroWorld new.
	w create: 3 turtles: 2.
	vid := (w breedsOf: 3) addVariable: 'a'.
	b := SBytecodeGenerator new.
	ret := b getVar: vid.
	self assert: ret isNil.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	self assert: (t evaluate: b code) equals: 0.
	w
		var: vid
		breedNo: 3
		at: 1
		put: 20.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	self assert: (t evaluate: b code) equals: 20