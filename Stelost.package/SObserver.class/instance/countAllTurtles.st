microworld
countAllTurtles
	| ret |
	ret := 0.
	sworld turtleBreedsDo: [ :each | ret := ret + each countAlive ].
	^ ret