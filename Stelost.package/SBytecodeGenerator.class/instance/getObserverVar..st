variable ops
getObserverVar: vid
	self appendValue: 1.
	self appendValue: vid.
	self appendValue: SBreedId observerBreedNo.
	self appendSymbol: #getBreedVar.
	^ nil