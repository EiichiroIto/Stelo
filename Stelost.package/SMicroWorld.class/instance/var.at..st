accessing variable
var: anInteger at: dummy
	anInteger = SObserverVarId widthVarNo
		ifTrue: [ ^ self patches rows ].
	anInteger = SObserverVarId heightVarNo
		ifTrue: [ ^ self patches cols ].
	anInteger = SObserverVarId turtlesCountVarNo
		ifTrue: [ ^ self countAllTurtles ].
	^ 0.