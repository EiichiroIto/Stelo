initialization
initialize
	super initialize.
	raisedEvents := Set new.
	breedId := SBreedId new.
	varId := SObserverVarId new.
	self setupBreeds.