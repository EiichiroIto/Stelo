tests-accessing
testAliveVarNo
	| v |
	v := STurtleVarId new.
	self assert: (v varNoFor: 'alive') equals: STurtleVarId aliveVarNo.