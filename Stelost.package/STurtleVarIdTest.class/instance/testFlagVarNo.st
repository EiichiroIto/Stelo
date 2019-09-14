tests-accessing
testFlagVarNo
	| v |
	v := STurtleVarId new.
	self assert: (v varNoFor: 'flag') equals: STurtleVarId flagVarNo.