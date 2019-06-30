accessing
regularize
	varNames asOrderedCollection removeAllFoundIn: self class reservedVarNames.
	varNames := self class reservedVarNames, varNames.
	nextNo := varNames size + 1.