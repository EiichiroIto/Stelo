tests-variable ops
testGetObserverVar
	| w b t ret |
	w := SMicroWorld new.
	w create: 3 turtles: 1.
	b := SBytecodeGenerator new.
	ret := b getObserverVar: SObserverVarId widthVarNo.
	self assert: ret isNil.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	self assert: (t evaluate: b code) equals: 100.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	w createPatchOrder: 10.
	self assert: (t evaluate: b code) equals: 10