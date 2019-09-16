accessing
sizeOf: bno
	^ (plugin
		getFloat: SObserverVarId sizeVarNo
		breed: SBreedId observerBreedNo
		id: bno) truncated