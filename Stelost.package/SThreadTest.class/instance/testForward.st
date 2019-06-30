tests-turtle instructions
testForward
	| e w |
	w := SMicroWorld new.
	w createPatchOrder: 5.
	w create: 3 turtles: 1.
	w x: 3 at: 1 put: 0.
	w y: 3 at: 1 put: 0.
	w
		var: STurtleVarId headingVarNo
		breedNo: 3
		at: 1
		put: 0.
	e := SThread microworld: w.
	e forBreedNo: 3 index: 1.
	e push: 1.
	e forward.
	self assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 1) closeTo: 1.
	self assert: (w var: STurtleVarId yVarNo breedNo: 3 at: 1) closeTo: 0.
	e push: 2.
	e forward.
	self
		assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 1)
		closeTo: -2.
	self assert: (w var: STurtleVarId yVarNo breedNo: 3 at: 1) closeTo: 0