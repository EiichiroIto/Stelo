tests-execution
testDoOneCycle
	| e w c |
	w := SMicroWorld new.
	w create: 3 turtles: 1.
	w x: 3 at: 1 put: 0.
	w y: 3 at: 1 put: 0.
	w
		var: STurtleVarId headingVarNo
		breedNo: 3
		at: 1
		put: 0.
	c := self sampleCode1.
	e := SThread microworld: w.
	e forBreedNo: 3 index: 1.
	e codes: c.
	self assert: e pc equals: 1.
	self assert: e stack isEmpty.
	self assert: e doOneCycle not.
	self assert: e pc equals: 3.
	self assert: e stack isEmpty.
	self assert: (w var: STurtleVarId xVarNo breedNo: 3 at: 1) equals: 3.
	self assert: (w var: STurtleVarId yVarNo breedNo: 3 at: 1) equals: 0.
	self assert: e doOneCycle not