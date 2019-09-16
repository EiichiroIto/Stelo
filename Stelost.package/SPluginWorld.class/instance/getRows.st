private
getRows
	^ (plugin
		getFloat: SObserverVarId heightVarNo
		breed: SBreedId observerBreedNo
		id: 1) truncated