tests-arithmetic ops
testMultiplyAnd
	| t b r |
	b := SBytecodeGenerator new.
	r := b multiply: 12 and: 3.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: 36.

	b := SBytecodeGenerator new.
	r := b multiply: 10 and: -3.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: -30.

	b := SBytecodeGenerator new.
	r := b multiply: 1.5 and: 5.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: 7.5.

	b := SBytecodeGenerator new.
	r := b multiply: -2 and: -4.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: 8.