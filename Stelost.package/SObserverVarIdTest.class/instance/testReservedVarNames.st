tests-accessing
testReservedVarNames
	self
		assertCollection: SObserverVarId reservedVarNames
		equals: #(width height maxBreedNo ticks countAlive size maxVar)