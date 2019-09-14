tests-variable ops
testGetObserverVar
	| w b t ret |
	w := self newWorld.
	w addBreed: (SObserver new sworld: w).
	w create: 3 turtles: 1.
	b := SBytecodeGenerator new.
	ret := b getObserverVar: SObserverVarId widthVarNo.
	self assert: ret isNil.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 100.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	w createPatch: 10.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 10