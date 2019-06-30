tests-initialization
testInitialize
	| o |
	o := SObserverVarId new.
	self assert: o size equals: 3.
	self assert: (o varNoFor: 'width') equals: SObserverVarId widthVarNo.
	self assert: (o varNoFor: 'height') equals: SObserverVarId heightVarNo.
	self assert: (o varNoFor: 'turtlesCount') equals: SObserverVarId turtlesCountVarNo.