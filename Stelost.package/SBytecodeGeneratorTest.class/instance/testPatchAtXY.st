tests-patch ops
testPatchAtXY
	| w b t |
	w := SMicroWorld new.
	w createPatchOrder: 3.

	b := SBytecodeGenerator new.
	b patchAtX: 0 y: 0.
	t := SThread microworld: w.
	self assert: (t evaluate: b code) equals: 5.

	b := SBytecodeGenerator new.
	b patchAtX: -1 y: 1.
	t := SThread microworld: w.
	self assert: (t evaluate: b code) equals: 7.