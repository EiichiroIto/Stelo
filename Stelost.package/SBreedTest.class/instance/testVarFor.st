tests-accessing
testVarFor
	| s |
	s := STurtles new.
	self assert: (s varNoFor: 'color') equals: STurtleVarId colorVarNo.
	self assert: (s varNoFor: 'x') equals: STurtleVarId xVarNo.
	self assert: (s varNoFor: 'y') equals: STurtleVarId yVarNo.