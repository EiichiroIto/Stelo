tests-accessing
testSize
	| v varId |
	varId := SVarId new.
	varId add: 'x'.
	v := SVariables new.
	v updateVarId: varId.
	self assert: v size equals: 0.
	v forceSize: 10.
	self assert: v size equals: 10.