tests-observer ops
testTurtlesCount
	| w b t |
	w := SMicroWorld new.
	w createPatchOrder: 3.
	w create: 3 turtles: 2.
	w patches var: SPatchVarId colorVarNo at: 1 put: 3.
	b := SBytecodeGenerator new.
	b turtlesCount: 3.
	self assert: (w var: SPatchVarId colorVarNo breedNo: 2 at: 1) equals: 3.
	self assert: w patches count equals: 9.
	self assert: (w breedsOf: 3) count equals: 2.
	t := SThread microworld: w.
	t forObserver.
	self assert: (t evaluate: b code) equals: 2