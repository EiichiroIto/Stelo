tests-patch ops
testRelativeToXY
	| w b t |
	w := self newWorld.
	w createPatch: 3.
	w create: 3 turtles: 1.

"1 2 3
 4 5 6
 7 8 9"

	b := SBytecodeGenerator new.
	b patchAtX: 0 y: 0.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 5.

	b := SBytecodeGenerator new.
	b relativeToX: -1 y: 0.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 4.

	b := SBytecodeGenerator new.
	b relativeToX: 0 y: 1.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 8.