test
testCountAliveOf
	| c |
	c := SteloLibCall new.
	self assert: (c countAliveOf: 2) equals: self defaultPatchSize.
	c createPatch: 10.
	self assert: (c countAliveOf: 2) equals: 100.
	self assert: (c countAliveOf: 3) equals: 0.
	c setupBreed: 3.
	self assert: (c countAliveOf: 3) equals: 0.
	c create: 3 turtles: 50.
	self assert: (c countAliveOf: 3) equals: 50.
	c create: 3 turtles: 5.
	self assert: (c countAliveOf: 3) equals: 55