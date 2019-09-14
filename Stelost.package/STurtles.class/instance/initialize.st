initialization
initialize
	varId := STurtleVarId new.
	variables := SVariables new updateVarId: varId.
	defaultColor := SColorList atRandom.
	defaultPosition := 0 @ 0.
	self clear.