accessing
userDefinedVarNoAndNames
	^ (self class defaultUserNo to: self size)
		collect: [ :each | 
			{each.
			(varNames at: each)} ]