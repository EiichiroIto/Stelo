tests-accessing
testClassForVarNo
	| pv |
	pv := STurtleVarId new.
	self assert: (pv classForVarNo: STurtleVarId colorVarNo) equals: ByteArray.
	self assert: (pv classForVarNo: STurtleVarId aliveVarNo) equals: Array.
	self assert: (pv classForVarNo: STurtleVarId penDownVarNo) equals: Array.
	self assert: (pv classForVarNo: STurtleVarId xVarNo) equals: FloatArray.
	self assert: (pv classForVarNo: STurtleVarId yVarNo) equals: FloatArray.
	self assert: (pv classForVarNo: STurtleVarId headingVarNo) equals: FloatArray.