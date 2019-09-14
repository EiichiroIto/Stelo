tests-arithmetic ops
testMultiplyAnd
	| t b r |
	b := SBytecodeGenerator new.
	r := b multiply: 12 and: 3.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 36.

	b := SBytecodeGenerator new.
	r := b multiply: 10 and: -3.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: -30.

	b := SBytecodeGenerator new.
	r := b multiply: 1.5 and: 5.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 7.5.

	b := SBytecodeGenerator new.
	r := b multiply: -2 and: -4.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 8.