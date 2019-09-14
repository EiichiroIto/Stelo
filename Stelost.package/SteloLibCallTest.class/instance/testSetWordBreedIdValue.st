test
testSetWordBreedIdValue
	| c x |
	c := SteloLibCall new.
	c setupBreed: 3.
	x := c getWord: STurtleVarId flagVarNo breed: 3 id: 1.
	self assert: x equals: 0.
	c create: 3 turtles: 1.
	x := c getWord: STurtleVarId flagVarNo breed: 3 id: 1.
	self assert: x equals: 1.
	c
		setWord: STurtleVarId flagVarNo
		breed: 3
		id: 1
		value: 10.
	x := c getWord: STurtleVarId flagVarNo breed: 3 id: 1.
	self assert: x equals: 10.