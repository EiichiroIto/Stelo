tests-accessing
testAllocateMore
	| v varId v1 v2 |
	v := SVariables new.
	varId := SVarId new.
	v1 := varId add: 'a'.
	v2 := varId add: 'b'.
	v updateVarId: varId.
	self assert: (v arrayOfVarNo: v1) size equals: 0.
	self assert: (v arrayOfVarNo: v2) size equals: 0.
	v allocateMore: 100.
	self assert: (v arrayOfVarNo: v1) size equals: 100.
	self assert: (v arrayOfVarNo: v2) size equals: 100.
	v allocateMore: 1.
	self assert: (v arrayOfVarNo: v1) size equals: 200.
	self assert: (v arrayOfVarNo: v2) size equals: 200.
	v allocateMore: 100.
	self assert: (v arrayOfVarNo: v1) size equals: 300.
	self assert: (v arrayOfVarNo: v2) size equals: 300.