tests-control ops
testDoUntilBegin
	| w b t i |
	w := SMicroWorld new.
	w create: 3 turtles: 1.
	(w breedsOf: 3) headingAt: 1 put: 0.
	b := SBytecodeGenerator new.
	i := b doUntilBegin.
	b forward: 1.
	b appendValue: 5.
	b getXpos.
	b appendSymbol: #less.
	b doUntilEnd: nil id: i.
	self assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 1) equals: 0.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t execute: b code.
	self assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 1) equals: 6