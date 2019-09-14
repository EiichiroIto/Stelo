tests-accessing
testReservedVarNames
	self
		assertCollection: SObserverVarId reservedVarNames
		equals: #(width height turtlesCount ticks)