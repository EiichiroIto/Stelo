test
testGetWordAllBreed
	| w t arr |
	w := SPluginWorld new.
	t := STurtles new breedNo: 3.
	t create: 2.
	w setupBreed: t.
	w var: STurtleVarId flagVarNo breed: 3 at: 1 put: 16r12345678.
	w var: STurtleVarId flagVarNo breed: 3 at: 2 put: 16r33333333.
	arr := w getByteAll: STurtleVarId flagVarNo breed: 3.
	self assert: arr size equals: 100.
	self assert: arr first equals: 16r78.
	self assert: arr second equals: 16r33.
	self assert: arr third equals: 0.