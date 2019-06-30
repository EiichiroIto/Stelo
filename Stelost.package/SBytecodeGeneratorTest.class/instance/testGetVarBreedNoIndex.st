tests-turtle  ops
testGetVarBreedNoIndex
	| w b vid t ret |
	w := SMicroWorld new.
	w createPatchOrder: 3.
	w create: 3 turtles: 1.
	vid := (w breedsOf: 3) addVariable: 'a'.
	w
		var: vid
		breedNo: 3
		at: 1
		put: 4.
	w
		var: vid
		breedNo: 3
		at: 2
		put: 5.
	b := SBytecodeGenerator new.
	ret := b getVar: [ :x | vid ] breedNo: 3 index: 2.
	self assert: ret isNil.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	self assert: (t evaluate: b code) equals: 5