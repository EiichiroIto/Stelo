initialization
initialize
	breedId := SBreedId new.
	varId := SObserverVarId new.
	variables := SVariables new updateVarId: varId.
	ticks := 0.