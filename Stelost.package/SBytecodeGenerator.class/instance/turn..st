turtle  ops
turn: aNumber
	self appendValue: aNumber.
	self getVar: STurtleVarId headingVarNo.
	self appendSymbol: #plus.
	self appendSymbol: #setHeading.