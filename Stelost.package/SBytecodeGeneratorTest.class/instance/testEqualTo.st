tests-arithmetic ops
testEqualTo
	| t b r |
	b := SBytecodeGenerator new.
	r := b equal: 12 to: 3.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: false.

	b := SBytecodeGenerator new.
	r := b equal: 10 to: -3.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: false.

	b := SBytecodeGenerator new.
	r := b equal: 5 to: 5.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: true.

	b := SBytecodeGenerator new.
	r := b equal: -2.5 to: -2.5.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: true.