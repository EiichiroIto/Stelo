accessing
countAliveOf: bno
	^ (plugin
		getFloat: SObserverVarId countAliveVarNo
		breed: SBreedId observerBreedNo
		id: bno) truncated