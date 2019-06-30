color ops
stamp
	self getVar: STurtleVarId xVarNo.
	self getVar: STurtleVarId yVarNo.
	self appendSymbol: #patchAt.
	self getVar: STurtleVarId colorVarNo.
	self appendSymbol: #setPatchColorTo.