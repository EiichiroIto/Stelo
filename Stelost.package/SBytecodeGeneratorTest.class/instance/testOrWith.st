tests-arithmetic ops
testOrWith
	| t b r |
	b := SBytecodeGenerator new.
	r := b or: true with: true.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 1.

	b := SBytecodeGenerator new.
	r := b or: true with: false.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 1.

	b := SBytecodeGenerator new.
	r := b or: false with: true.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 1.

	b := SBytecodeGenerator new.
	r := b or: false with: false.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 0.