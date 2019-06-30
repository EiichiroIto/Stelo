tests
testInitialize
	| v |
	v := SVariables new.
	self assert: v privVarNames isArray.
	self assert: v privVarNames isEmpty.