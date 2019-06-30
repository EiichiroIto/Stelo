tests-accessing
testArrayOfVarNo
	| v varId |
	v := SVariables new.
	varId := SVarId new.
	varId add: 'a'.
	varId add: 'b'.
	v updateVarId: varId.
	self assert: (v arrayOfVarNo: 1) isEmpty.
	self assert: (v arrayOfVarNo: 2) isEmpty.
	v privVars at: 1 put: 10.
	v privVars at: 2 put: 20.
	self assert: (v arrayOfVarNo: 1) equals: 10.
	self assert: (v arrayOfVarNo: 2) equals: 20.