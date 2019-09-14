test
testSetFloatBreedIdValue
	| c x |
	c := SteloLibCall new.
	c setupBreed: 3.
	c create: 3 turtles: 1.
	x := c getFloat: STurtleVarId xVarNo breed: 3 id: 1.
	self assert: x closeTo: 0.
	c
		setFloat: STurtleVarId xVarNo
		breed: 3
		id: 1
		value: 1.0.
	x := c getFloat: STurtleVarId xVarNo breed: 3 id: 1.
	self assert: x closeTo: 1.
	c
		setFloat: SObserverVarId ticksVarNo
		breed: SBreedId observerBreedNo
		id: 0
		value: 120.
	x := c
		getFloat: SObserverVarId ticksVarNo
		breed: SBreedId observerBreedNo
		id: 0.
	self assert: x equals: 120.
	c
		setFloat: SObserverVarId ticksVarNo
		breed: SBreedId observerBreedNo
		id: 0
		value: 10.
	x := c
		getFloat: SObserverVarId ticksVarNo
		breed: SBreedId observerBreedNo
		id: 0.
	self assert: x equals: 10