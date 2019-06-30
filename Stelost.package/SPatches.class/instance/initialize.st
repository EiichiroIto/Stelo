initialization
initialize
	varId := SPatchVarId new.
	variables := SVariables new updateVarId: varId.
	diffuser := SDiffuser2 new.
	self create: self defaultOrder.