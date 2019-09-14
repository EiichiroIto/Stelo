tests-arithmetic ops
testNot
	| t b r |
	b := SBytecodeGenerator new.
	r := b not: true.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 0.

	b := SBytecodeGenerator new.
	r := b not: false.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 1.