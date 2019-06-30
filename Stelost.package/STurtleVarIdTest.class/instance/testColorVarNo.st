tests-accessing
testColorVarNo
	| v |
	v := STurtleVarId new.
	self assert: (v varNoFor: 'color') equals: STurtleVarId colorVarNo.