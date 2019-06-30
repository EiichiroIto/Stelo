tests-accessing
testCopyElementFromTo
	| v varId v1 v2 |
	v := SVariables new.
	varId := SVarId new.
	v1 := varId add: 'a'.
	v2 := varId add: 'b'.
	v updateVarId: varId.
	v allocateMore: 2.
	(v arrayOfVarNo: v1) at: 1 put: 2.
	(v arrayOfVarNo: v1) at: 2 put: 3.
	(v arrayOfVarNo: v2) at: 1 put: 20.
	(v arrayOfVarNo: v2) at: 2 put: 30.
	self assert: ((v arrayOfVarNo: v1) at: 1) equals: 2.
	self assert: ((v arrayOfVarNo: v1) at: 2) equals: 3.
	self assert: ((v arrayOfVarNo: v2) at: 1) equals: 20.
	self assert: ((v arrayOfVarNo: v2) at: 2) equals: 30.
	v copyElementFrom: 1 to: 2.
	self assert: ((v arrayOfVarNo: v1) at: 1) equals: 2.
	self assert: ((v arrayOfVarNo: v1) at: 2) equals: 2.
	self assert: ((v arrayOfVarNo: v2) at: 1) equals: 20.
	self assert: ((v arrayOfVarNo: v2) at: 2) equals: 20.
	(v arrayOfVarNo: v1) at: 1 put: 4.
	self assert: ((v arrayOfVarNo: v1) at: 1) equals: 4.
	self assert: ((v arrayOfVarNo: v1) at: 2) equals: 2.
	self assert: ((v arrayOfVarNo: v2) at: 1) equals: 20.
	self assert: ((v arrayOfVarNo: v2) at: 2) equals: 20.