initialization
initialize
	varId := STurtleVarId new.
	variables := SVariables new updateVarId: varId.
	defaultColor := SColorList atRandom.
	self clear.