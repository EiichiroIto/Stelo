tests-control ops
testDoRepeatBegin
	| w b t arr |
	w := SMicroWorld new.
	w create: 3 turtles: 1.
	(w breedsOf: 3) headingAt: 1 put: 0.
	b := SBytecodeGenerator new.
	b appendValue: false.
	arr := b doRepeatBegin: 5.
	b forward: 1.
	b doRepeatEndLabels: arr.
	self assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 1) equals: 0.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t execute: b code.
	self assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 1) equals: 5