tests-color ops
testGetColor
	| w b t ret |
	w := self newWorld.
	w createPatch: 3.
	w create: 3 turtles: 1.
	w
		var: STurtleVarId colorVarNo
		breed: 3
		at: 1
		put: SColorList red.
	w
		var: STurtleVarId colorVarNo
		breed: 3
		at: 2
		put: SColorList yellow.
	w
		var: SPatchVarId colorVarNo
		breed: 2
		at: 1
		put: SColorList green.
	w
		var: SPatchVarId colorVarNo
		breed: 2
		at: 2
		put: SColorList blue.
	b := SBytecodeGenerator new.
	ret := b getColor.
	self assert: ret isNil.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	ret := t evaluate: 1.
	self assert: ret equals: SColorList red.
	t := SThread sworld: w.
	t forPatchId: 2.
	t codes: b code.
	ret := t evaluate: 1.
	self assert: ret equals: SColorList blue