tests-patch ops
testSetPatchColorXYTo
	| w b t |
	w := SMicroWorld new.
	"
	1 2 3
	4 5 6
	7 8 9
"
	w createPatchOrder: 3.
	w create: 3 turtles: 1.
	b := SBytecodeGenerator new.
	b setPatchColorX: 1 y: 2 to: SColorList red.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t execute: b code.
	self
		assert: (w var: SPatchVarId colorVarNo breedNo: 2 at: 3)
		equals: SColorList red.
	t := SThread microworld: w.
	t forPatchId: 2.
	t execute: b code.
	self
		assert: (w var: SPatchVarId colorVarNo breedNo: 2 at: 9)
		equals: SColorList red.
	self
		assert: (w var: SPatchVarId colorVarNo breedNo: 2 at: 1)
		equals: SColorList black