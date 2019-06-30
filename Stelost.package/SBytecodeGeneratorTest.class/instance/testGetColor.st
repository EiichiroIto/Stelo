tests-color ops
testGetColor
	| w b t ret |
	w := SMicroWorld new.
	w createPatchOrder: 3.
	w create: 3 turtles: 1.
	w
		var: STurtleVarId colorVarNo
		breedNo: 3
		at: 1
		put: SColorList red.
	w
		var: STurtleVarId colorVarNo
		breedNo: 3
		at: 2
		put: SColorList yellow.
	w
		var: SPatchVarId colorVarNo
		breedNo: 2
		at: 1
		put: SColorList green.
	w
		var: SPatchVarId colorVarNo
		breedNo: 2
		at: 2
		put: SColorList blue.
	b := SBytecodeGenerator new.
	ret := b getColor.
	self assert: ret isNil.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	ret := t evaluate: b code.
	self assert: ret equals: SColorList red.
	t := SThread microworld: w.
	t forPatchId: 2.
	ret := t evaluate: b code.
	self assert: ret equals: SColorList blue