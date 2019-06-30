tests-patch ops
testGetPatchColorXY
	| w b t ret |
	w := SMicroWorld new.
	"
	1 2 3
	4 5 6
	7 8 9
"
	w createPatchOrder: 3.
	w create: 3 turtles: 1.
	w
		var: SPatchVarId colorVarNo
		breedNo: 2
		at: 3
		put: SColorList green.
	w
		var: SPatchVarId colorVarNo
		breedNo: 2
		at: 5
		put: SColorList blue.
	w
		var: SPatchVarId colorVarNo
		breedNo: 2
		at: 6
		put: SColorList yellow.
	w
		var: SPatchVarId colorVarNo
		breedNo: 2
		at: 7
		put: SColorList red.
	w
		var: SPatchVarId colorVarNo
		breedNo: 2
		at: 9
		put: SColorList lime.
	b := SBytecodeGenerator new.
	ret := b getPatchColorX: 1 y: 2.
	self assert: ret isNil.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	ret := t evaluate: b code.
	self assert: ret equals: SColorList green.
	b := SBytecodeGenerator new.
	ret := b getPatchColorX: 1 y: 2.
	t := SThread microworld: w.
	t forPatchId: 2.
	ret := t evaluate: b code.
	self assert: ret equals: SColorList lime