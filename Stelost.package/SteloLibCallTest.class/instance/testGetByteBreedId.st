test
testGetByteBreedId
	| c x |
	c := SteloLibCall new.
	c setupBreed: 3.
	c create: 3 turtles: 1.
	c
		setByte: STurtleVarId colorVarNo
		breed: 3
		id: 1
		value: 10.
	x := c getByte: STurtleVarId colorVarNo breed: 3 id: 1.
	self assert: x equals: 10