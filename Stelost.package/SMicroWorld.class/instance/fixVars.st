accessing
fixVars
	breeds
		do: [ :each | 
			each = self
				ifFalse: [ each fixVars ] ].