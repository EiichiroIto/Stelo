tests-misc ops
testHatch
	| w b t |
	w := SMicroWorld new.
	w create: 3 turtles: 1.
	w
		var: STurtleVarId colorVarNo
		breedNo: 3
		at: 1
		put: 15.
	b := SBytecodeGenerator new.
	b hatch.
	self assert: (w breedsOf: 3) count equals: 1.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t execute: b code.
	self assert: (w breedsOf: 3) count equals: 2.
	self
		assert: (w var: STurtleVarId colorVarNo breedNo: 3 at: 1)
		equals: 15.
	self
		assert: (w var: STurtleVarId colorVarNo breedNo: 3 at: 2)
		equals: 15