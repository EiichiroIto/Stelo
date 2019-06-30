command
multiplyBy: aNumber varNo: anInteger
	| src |
	src := variables arrayOfVarNo: anInteger.
	src *= aNumber.