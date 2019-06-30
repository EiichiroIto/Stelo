accessing variable
var: anInteger1 at: anInteger2
	anInteger1 = SPatchVarId xVarNo
		ifTrue: [ ^ self xAt: anInteger2 ].
	anInteger1 = SPatchVarId yVarNo
		ifTrue: [ ^ self yAt: anInteger2 ].
	^ super var: anInteger1 at: anInteger2