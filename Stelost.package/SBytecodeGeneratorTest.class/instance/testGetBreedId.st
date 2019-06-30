tests-variable ops
testGetBreedId
	| w b t ret |
	w := SMicroWorld new.
	w createPatchOrder: 3.
	w create: 3 turtles: 1.
	b := SBytecodeGenerator new.
	ret := b getBreedId.
	self assert: ret isNil.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	self assert: (t evaluate: b code) equals: 3.

	t := SThread microworld: w.
	t forPatchId: 2.
	self assert: (t evaluate: b code) equals: 2.

	t := SThread microworld: w.
	t forObserver.
	self assert: (t evaluate: b code) equals: 1.