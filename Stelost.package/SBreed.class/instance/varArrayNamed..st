accessing variable
varArrayNamed: aString
	| vno |
	vno := self varNoFor: aString.
	^ variables arrayOfVarNo: vno