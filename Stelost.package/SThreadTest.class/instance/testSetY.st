tests-turtle ops
testSetY
	| w t |
	w := SMicroWorld new.
	w create: 3 turtles: 2.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	self assert: t stack size equals: 0.
	self assert: (w var: STurtleVarId yVarNo breedNo: 3 at: 1) equals: 0.
	self assert: (w var: STurtleVarId yVarNo breedNo: 3 at: 2) equals: 0.
	t push: 10.
	t setY.
	self assert: t stack size equals: 0.
	self assert: (w var: STurtleVarId yVarNo breedNo: 3 at: 1) equals: 10.
	self assert: (w var: STurtleVarId yVarNo breedNo: 3 at: 2) equals: 0.
	t push: 20.
	t setY.
	self assert: (w var: STurtleVarId yVarNo breedNo: 3 at: 1) equals: 20.
	self assert: (w var: STurtleVarId yVarNo breedNo: 3 at: 2) equals: 0.