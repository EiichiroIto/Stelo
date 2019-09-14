tests-initialization
testInitialize
	| ts |
	ts := STurtles new.
	self assert: ts varId class equals: STurtleVarId.
	self assert: ts privVariables class equals: SVariables.
	self assert: ts countAlive equals: 0.