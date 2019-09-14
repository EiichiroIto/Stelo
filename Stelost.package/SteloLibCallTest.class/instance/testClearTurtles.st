test
testClearTurtles
	| c |
	c := SteloLibCall new.
	self assert: (c countAliveOf: 3) equals: 0.
	c setupBreed: 3.
	self assert: (c countAliveOf: 3) equals: 0.
	self assert: (c sizeOf: 3) equals: 100.
	c create: 3 turtles: 50.
	self assert: (c countAliveOf: 3) equals: 50.
	c clearTurtles.
	self assert: (c countAliveOf: 3) equals: 0.
	self assert: (c sizeOf: 3) equals: 100