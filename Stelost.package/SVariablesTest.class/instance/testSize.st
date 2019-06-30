tests-accessing
testSize
	| v varId |
	varId := SVarId new.
	varId add: 'x'.
	v := SVariables new.
	v updateVarId: varId.
	self assert: v size equals: 1.
	varId add: 'y'.
	v updateVarId: varId.
	self assert: v size equals: 2.