command
diffuse8: anInteger1 varNo: anInteger2
	| buf |
	buf := variables arrayOfVarNo: anInteger2.
	diffuser diffuse: buf order: order percent: anInteger1 neighborSize: 8.