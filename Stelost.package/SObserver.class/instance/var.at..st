microworld
var: anInteger at: id
	anInteger = SObserverVarId widthVarNo
		ifTrue: [ ^ sworld extent x ].
	anInteger = SObserverVarId heightVarNo
		ifTrue: [ ^ sworld extent y ].
	anInteger = SObserverVarId maxBreedVarNo
		ifTrue: [ ^ sworld maxBreedNo ].
	anInteger = SObserverVarId ticksVarNo
		ifTrue: [ ^ ticks ].
	anInteger = varId countAliveVarNo
		ifTrue: [ ^ sworld countAliveOf: id ].
	anInteger = varId sizeVarNo
		ifTrue: [ ^ sworld sizeOf: id ].
	anInteger = varId maxVarNo
		ifTrue: [ ^ self ].
	^ 0.