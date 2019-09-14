variables
addVariable: aString
	| vno |
	vno := breed addVariable: aString.
	self sworld addVariable: aString var: vno breed: breed breedNo.