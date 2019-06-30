tests-accessing
testSetVarToAll
	| v varId v1 |
	v := SVariables new.
	varId := SVarId new.
	v1 := varId add: 'a'.
	v updateVarId: varId.
	v allocateMore: 2.
	self assert: (v arrayOfVarNo: v1) first equals: 0.
	self assert: (v arrayOfVarNo: v1) second equals: 0.
	v setVar: v1 toAll: 1.
	self assert: (v arrayOfVarNo: v1) first equals: 1.
	self assert: (v arrayOfVarNo: v1) second equals: 1.