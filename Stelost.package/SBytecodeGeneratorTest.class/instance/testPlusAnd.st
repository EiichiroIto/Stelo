tests-arithmetic ops
testPlusAnd
	| t b r |
	b := SBytecodeGenerator new.
	r := b plus: 12 and: 3.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 15.

	b := SBytecodeGenerator new.
	r := b plus: 10 and: -3.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 7.

	b := SBytecodeGenerator new.
	r := b plus: 1.5 and: 5.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 6.5.

	b := SBytecodeGenerator new.
	r := b plus: -2 and: -4.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: -6.