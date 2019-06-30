command
createPatchOrder: anInteger
	self turtleBreedsDo: [ :ts | ts clear ].
	self patches create: anInteger.