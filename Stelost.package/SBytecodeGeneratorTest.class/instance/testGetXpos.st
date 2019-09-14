tests-turtle  ops
testGetXpos
	| w b t ret |
	w := self newWorld.
	w createPatch: 5.
	w create: 3 turtles: 2.
	w x: 3 at: 1 put: 2.
	w x: 3 at: 2 put: 3.
	b := SBytecodeGenerator new.
	ret := b getXpos.
	self assert: ret isNil.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 2.
	b := SBytecodeGenerator new.
	b getXpos.
	t := SThread sworld: w.
	t forPatchId: 1.
	t codes: b code.
	self assert: (t evaluate: 1) equals: -2.
	b := SBytecodeGenerator new.
	b getXpos.
	t := SThread sworld: w.
	t forPatchId: 7.
	t codes: b code.
	self assert: (t evaluate: 1) equals: -1