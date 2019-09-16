tests-initialization
testInitialize
	| o |
	o := SObserverVarId new.
	self assert: o size equals: 7.
	self assert: (o varNoFor: 'width') equals: SObserverVarId widthVarNo.
	self assert: (o varNoFor: 'height') equals: SObserverVarId heightVarNo.
	self assert: (o varNoFor: 'maxBreedNo') equals: SObserverVarId maxBreedVarNo.
	self assert: (o varNoFor: 'ticks') equals: SObserverVarId ticksVarNo.
	self assert: (o varNoFor: 'countAlive') equals: SObserverVarId countAliveVarNo.
	self assert: (o varNoFor: 'size') equals: SObserverVarId sizeVarNo.
	self assert: (o varNoFor: 'maxVar') equals: SObserverVarId maxVarNo.