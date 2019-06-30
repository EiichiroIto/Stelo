tests-accessing
testForceSize
	| v varId v1 v2 |
	v := SVariables new.
	varId := SVarId new.
	v1 := varId add: 'a'.
	v2 := varId add: 'b'.
	v updateVarId: varId.
	self assert: (v arrayOfVarNo: v1) size equals: 0.
	self assert: (v arrayOfVarNo: v2) size equals: 0.
	v forceSize: 100.
	self assert: (v arrayOfVarNo: v1) size equals: 100.
	self assert: (v arrayOfVarNo: v2) size equals: 100.
	v forceSize: 150.
	self assert: (v arrayOfVarNo: v1) size equals: 150.
	self assert: (v arrayOfVarNo: v2) size equals: 150.
	v forceSize: 120.
	self assert: (v arrayOfVarNo: v1) size equals: 120.
	self assert: (v arrayOfVarNo: v2) size equals: 120.