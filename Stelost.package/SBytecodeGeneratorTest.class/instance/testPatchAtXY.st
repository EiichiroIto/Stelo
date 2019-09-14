tests-patch ops
testPatchAtXY
	| w b t |
	w := self newWorld.
	w createPatch: 3.

	b := SBytecodeGenerator new.
	b patchAtX: 0 y: 0.
	t := SThread sworld: w.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 5.

	b := SBytecodeGenerator new.
	b patchAtX: -1 y: 1.
	t := SThread sworld: w.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 7.