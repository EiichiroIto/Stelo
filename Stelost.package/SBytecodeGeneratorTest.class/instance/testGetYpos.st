tests-turtle  ops
testGetYpos
	| w b t ret |
	w := SMicroWorld new.
	w createPatchOrder: 5.
	w create: 3 turtles: 2.
	w y: 3 at: 1 put: 2.
	w y: 3 at: 2 put: 3.
	b := SBytecodeGenerator new.
	ret := b getYpos.
	self assert: ret isNil.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	self assert: (t evaluate: b code) equals: 2.
	b := SBytecodeGenerator new.
	b getYpos.
	t := SThread microworld: w.
	t forPatchId: 1.
	self assert: (t evaluate: b code) equals: -2.
	b := SBytecodeGenerator new.
	b getYpos.
	t := SThread microworld: w.
	t forPatchId: 7.
	self assert: (t evaluate: b code) equals: -1