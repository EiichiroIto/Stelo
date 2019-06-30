tests-arithmetic ops
testIsBetweenAnd
	| t b r |
	b := SBytecodeGenerator new.
	r := b is: 10 between: 3 and: 12.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: true.

	b := SBytecodeGenerator new.
	r := b is: 10 between: 10 and: 12.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: true.

	b := SBytecodeGenerator new.
	r := b is: 12 between: 10 and: 12.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: true.

	b := SBytecodeGenerator new.
	r := b is: 9 between: 10 and: 12.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: false.

	b := SBytecodeGenerator new.
	r := b is: 13 between: 10 and: 12.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: false.