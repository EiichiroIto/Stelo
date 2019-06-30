tests-arithmetic ops
testRounded
	| t b r |
	b := SBytecodeGenerator new.
	r := b rounded: 10.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: 10.

	b := SBytecodeGenerator new.
	r := b rounded: 10.2.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: 10.

	b := SBytecodeGenerator new.
	r := b rounded: 10.5.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: 11.

	b := SBytecodeGenerator new.
	r := b rounded: -10.5.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: -11.