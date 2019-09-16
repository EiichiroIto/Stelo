test
testClearTurtles
	| c t |
	c := SPluginWorld new.
	self assert: (c countAliveOf: 3) equals: 0.
	t := STurtles new breedNo: 3.
	c setupBreed: t.
	self assert: (c countAliveOf: 3) equals: 0.
	self assert: (c sizeOf: 3) equals: 100.
	c create: 3 turtles: 50.
	self assert: (c countAliveOf: 3) equals: 50.
	c clearTurtles.
	self assert: (c countAliveOf: 3) equals: 0.
	self assert: (c sizeOf: 3) equals: 100