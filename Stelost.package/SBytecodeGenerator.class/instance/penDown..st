turtle  ops
penDown: aBoolean
	self appendValue: STurtleVarId flagVarNo.
	self getVar: STurtleVarId flagVarNo.
	self appendValue: 1 << STurtleVarId penDownFlagNo.
	aBoolean
		ifTrue: [ self appendSymbol: #or ]
		ifFalse: [ self appendSymbol: #inv.
			self appendSymbol: #and ].
	self appendSymbol: #setVarTo