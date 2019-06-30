tests-accessing
testClassForVarNo
	| v |
	v := SVarId new.
	self assert: (v classForVarNo: 1) equals: FloatArray.