tests-patch ops
testSetPatchColorAtTo
	| w b t pno |
	w := self newWorld.
	"
	1 2 3
	4 5 6
	7 8 9
"
	w createPatch: 3.
	w create: 3 turtles: 1.
	b := SBytecodeGenerator new.
	pno := w patchIndexAtX: 1 y: 2.
	b setPatchColorAt: pno to: SColorList red.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	t execute: 1.
	self
		assert: (w var: SPatchVarId colorVarNo breed: 2 at: 3)
		equals: SColorList red.
	b := SBytecodeGenerator new.
	b setPatchColorAt: 9 to: SColorList red.
	t := SThread sworld: w.
	t forPatchId: 2.
	t codes: b code.
	t execute: 1.
	self
		assert: (w var: SPatchVarId colorVarNo breed: 2 at: 9)
		equals: SColorList red.
	self
		assert: (w var: SPatchVarId colorVarNo breed: 2 at: 1)
		equals: SColorList black