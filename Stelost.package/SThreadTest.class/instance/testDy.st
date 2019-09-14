tests-turtle ops
testDy
	| e w |
	w := self newWorld.
	w create: 3 turtles: 1.
	w
		var: STurtleVarId headingVarNo
		breed: 3
		at: 1
		put: 0.
	e := SThread sworld: w.
	e forBreedNo: 3 index: 1.
	e dy.
	self assert: e pop closeTo: 0.
	w
		var: STurtleVarId headingVarNo
		breed: 3
		at: 1
		put: 90.
	e := SThread sworld: w.
	e forBreedNo: 3 index: 1.
	e dy.
	self assert: e pop closeTo: 1.
	w
		var: STurtleVarId headingVarNo
		breed: 3
		at: 1
		put: 180.
	e := SThread sworld: w.
	e forBreedNo: 3 index: 1.
	e dy.
	self assert: e pop closeTo: 0.
	w
		var: STurtleVarId headingVarNo
		breed: 3
		at: 1
		put: 270.
	e := SThread sworld: w.
	e forBreedNo: 3 index: 1.
	e dy.
	self assert: e pop closeTo: -1