test
testSetWordAllBreedExtArraySize
	| c ext x |
	c := SteloLibCall new.
	c setupBreed: 3.
	c create: 3 turtles: 3.
	x := c getByte: STurtleVarId flagVarNo breed: 3 id: 1.
	self assert: x equals: 1.
	x := c getByte: STurtleVarId flagVarNo breed: 3 id: 2.
	self assert: x equals: 1.
	x := c getByte: STurtleVarId flagVarNo breed: 3 id: 3.
	self assert: x equals: 1.
	ext := FFIExternalArray externalNewType: 'uint8' size: 3.
	ext at: 1 put: 5.
	ext at: 2 put: 10.
	ext at: 3 put: 15.
	[ 	c setByteAll: STurtleVarId flagVarNo breed: 3 extArray: ext size: 3 ]
	ensure: [ ext release ].
	x := c getByte: STurtleVarId flagVarNo breed: 3 id: 1.
	self assert: x equals: 5.
	x := c getByte: STurtleVarId flagVarNo breed: 3 id: 2.
	self assert: x equals: 10.
	x := c getByte: STurtleVarId flagVarNo breed: 3 id: 3.
	self assert: x equals: 15.