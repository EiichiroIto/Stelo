tests-accessing
testXVarNo
	| v |
	v := STurtleVarId new.
	self assert: (v varNoFor: 'x') equals: STurtleVarId xVarNo.