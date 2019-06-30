tests-turtle ops
testSetX
	| w t |
	w := SMicroWorld new.
	w create: 3 turtles: 2.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	self assert: t stack size equals: 0.
	self assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 1) equals: 0.
	self assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 2) equals: 0.
	t push: 10.
	t setX.
	self assert: t stack size equals: 0.
	self assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 1) equals: 10.
	self assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 2) equals: 0.
	t push: 20.
	t setX.
	self assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 1) equals: 20.
	self assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 2) equals: 0.