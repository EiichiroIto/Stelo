tests-misc ops
testTurtleAt
	| w b t pno |
	w := self newWorld.
	w create: 3 turtles: 3.
	w x: 3 at: 3 put: 1.
	b := SBytecodeGenerator new.
	pno := w patchIndexAtX: 0 y: 0.
	b turtle: 3 at: pno.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 2.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 2.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 1.
	b := SBytecodeGenerator new.
	pno := w patchIndexAtX: 1 y: 0.
	b turtle: 3 at: pno.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 3.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 0.
	t := SThread sworld: w.
	t forPatchId: (w patches indexAtPoint: 1 @ 0).
	t codes: b code.
	self assert: (t evaluate: 1) equals: 3.
	b := SBytecodeGenerator new.
	b turtle: 3 at: pno.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 3.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 3.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 0