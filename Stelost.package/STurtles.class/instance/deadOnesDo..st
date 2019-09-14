enumerating
deadOnesDo: aBlock
	1 to: variables size do: [ :each | 
		(self flag: STurtleVarId aliveFlagNo at: each)
			ifFalse: [ aBlock value: each ] ]