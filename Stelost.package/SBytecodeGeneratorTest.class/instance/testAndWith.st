tests-arithmetic ops
testAndWith
	| t b r |
	b := SBytecodeGenerator new.
	r := b and: true with: true.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 1.

	b := SBytecodeGenerator new.
	r := b and: true with: false.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 0.

	b := SBytecodeGenerator new.
	r := b and: false with: true.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 0.

	b := SBytecodeGenerator new.
	r := b and: false with: false.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 0.