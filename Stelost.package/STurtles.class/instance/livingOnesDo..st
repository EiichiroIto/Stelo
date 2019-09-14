enumerating
livingOnesDo: aBlock
	1 to: variables size do: [ :each | 
		(self flag: STurtleVarId aliveFlagNo at: each)
			ifTrue: [ aBlock value: each ] ]