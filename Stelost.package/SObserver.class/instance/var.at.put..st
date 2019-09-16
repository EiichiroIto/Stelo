microworld
var: anInteger at: dummy put: anObject
	anInteger = varId widthVarNo
		ifTrue: [ ^ self ].
	anInteger = varId heightVarNo
		ifTrue: [ ^ self ].
	anInteger = varId maxBreedVarNo
		ifTrue: [ ^ self ].
	anInteger = varId ticksVarNo
		ifTrue: [ ^ ticks := anObject ].
	anInteger = varId countAliveVarNo
		ifTrue: [ ^ self ].
	anInteger = varId sizeVarNo
		ifTrue: [ ^ self ].
	anInteger = varId maxVarNo
		ifTrue: [ ^ self ].