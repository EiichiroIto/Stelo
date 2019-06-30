tests-misc ops
testGetId
	| w b t ret |
	w := SMicroWorld new.
	w createPatchOrder: 3.
	w create: 3 turtles: 1.
	b := SBytecodeGenerator new.
	ret := b getId.
	self assert: ret isNil.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	self assert: (t evaluate: b code) equals: 1.
	t := SThread microworld: w.
	t forPatchId: 2.
	self assert: (t evaluate: b code) equals: 2.
	t := SThread microworld: w.
	t forPatchId: 3.
	self assert: (t evaluate: b code) equals: 3.