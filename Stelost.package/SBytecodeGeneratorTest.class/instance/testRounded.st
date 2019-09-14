tests-arithmetic ops
testRounded
	| t b r |
	b := SBytecodeGenerator new.
	r := b rounded: 10.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 10.

	b := SBytecodeGenerator new.
	r := b rounded: 10.2.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 10.

	b := SBytecodeGenerator new.
	r := b rounded: 10.5.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 11.

	b := SBytecodeGenerator new.
	r := b rounded: -10.5.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: -11.