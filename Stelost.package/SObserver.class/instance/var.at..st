microworld
var: anInteger at: dummy
	anInteger = SObserverVarId widthVarNo
		ifTrue: [ ^ sworld extent x ].
	anInteger = SObserverVarId heightVarNo
		ifTrue: [ ^ sworld extent y ].
	anInteger = SObserverVarId turtlesCountVarNo
		ifTrue: [ ^ self countAllTurtles ].
	anInteger = SObserverVarId ticksVarNo
		ifTrue: [ ^ ticks ].
	^ 0.