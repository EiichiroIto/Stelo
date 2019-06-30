command
nsum4: anInteger1 to: anInteger2
	| src dst |
	src := variables arrayOfVarNo: anInteger1.
	dst := variables arrayOfVarNo: anInteger2.
	diffuser nsum: src dst: dst order: order neighborSize: 4.