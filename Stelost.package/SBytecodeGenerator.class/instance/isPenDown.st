turtle  ops
isPenDown
	self appendValue: 0.
	self getVar: STurtleVarId flagVarNo.
	self appendValue: 1 << STurtleVarId penDownFlagNo.
	self appendSymbol: #and.
	self appendSymbol: #less.
	^ nil