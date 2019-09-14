accessing variable
flag: anInteger at: id
	| vars v b |
	vars := variables arrayOfVarNo: varId class flagVarNo.
	b := 1 << anInteger.
	v := vars at: id.
	^ (v bitAnd: b) > 0