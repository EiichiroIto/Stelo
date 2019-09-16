private
getCols
	^ (plugin
		getFloat: SObserverVarId widthVarNo
		breed: SBreedId observerBreedNo
		id: 1) truncated