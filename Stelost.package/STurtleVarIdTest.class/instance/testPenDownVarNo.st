tests-accessing
testPenDownVarNo
	| v |
	v := STurtleVarId new.
	self assert: (v varNoFor: 'penDown') equals: STurtleVarId penDownVarNo.