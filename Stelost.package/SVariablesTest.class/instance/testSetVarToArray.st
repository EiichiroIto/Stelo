tests-accessing
testSetVarToArray
	| v varId v1 a |
	v := SVariables new.
	varId := SVarId new.
	v1 := varId add: 'a'.
	v updateVarId: varId.
	self assert: (v arrayOfVarNo: v1) isEmpty.
	a := #(1 2 3) asFloatArray.
	v setVar: v1 toArray: a.
	self assert: (v arrayOfVarNo: v1) equals: a.