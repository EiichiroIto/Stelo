tests-arithmetic ops
testIsBetweenAnd
	| t b r |
	b := SBytecodeGenerator new.
	r := b is: 10 between: 3 and: 12.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 1.

	b := SBytecodeGenerator new.
	r := b is: 10 between: 10 and: 12.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 1.

	b := SBytecodeGenerator new.
	r := b is: 12 between: 10 and: 12.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 1.

	b := SBytecodeGenerator new.
	r := b is: 9 between: 10 and: 12.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 0.

	b := SBytecodeGenerator new.
	r := b is: 13 between: 10 and: 12.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 0.