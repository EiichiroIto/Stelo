tests-misc ops
testTurtleXY
	| w b t |
	w := SMicroWorld new.
	w create: 3 turtles: 3.
	w x: 3 at: 3 put: 1.
	b := SBytecodeGenerator new.
	b turtle: 3 x: 0 y: 0.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	self assert: (t evaluate: b code) equals: 2.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 2.
	self assert: (t evaluate: b code) equals: 1.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 3.
	self assert: (t evaluate: b code) equals: 0.
	t := SThread microworld: w.
	t forPatchId: (w patches indexAtPoint: 1 @ 0).
	self assert: (t evaluate: b code) equals: 3.
	b := SBytecodeGenerator new.
	b turtle: 3 x: 1 y: 0.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	self assert: (t evaluate: b code) equals: 3.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 3.
	self assert: (t evaluate: b code) equals: 0