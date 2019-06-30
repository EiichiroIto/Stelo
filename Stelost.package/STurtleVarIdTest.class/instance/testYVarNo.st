tests-accessing
testYVarNo
	| v |
	v := STurtleVarId new.
	self assert: (v varNoFor: 'y') equals: STurtleVarId yVarNo.