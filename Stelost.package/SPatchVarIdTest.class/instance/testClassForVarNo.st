tests-accessing
testClassForVarNo
	| pv |
	pv := SPatchVarId new.
	self assert: (pv classForVarNo: SPatchVarId colorVarNo) equals: ByteArray.
	self assert: (pv classForVarNo: SPatchVarId xVarNo) isNil.
	self assert: (pv classForVarNo: SPatchVarId yVarNo) isNil.