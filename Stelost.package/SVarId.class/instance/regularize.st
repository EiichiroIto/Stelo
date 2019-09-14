accessing
regularize
	varNames asOrderedCollection removeAllFoundIn: self class reservedVarNames.
	varNames := self class reservedVarNames, varNames.
	varNames := varNames asOrderedCollection.
	nextNo := varNames size + 1.