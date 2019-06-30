accessing variable
var: anInteger at: dummy put: anObject
	anInteger = varId widthVarNo
		ifTrue: [ ^ self ].
	anInteger = varId heightVarNo
		ifTrue: [ ^ self ].
	anInteger = varId turtlesCountVarNo
		ifTrue: [ ^ self ].