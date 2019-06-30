tests-arithmetic ops
testMinusWith
	| t b r |
	b := SBytecodeGenerator new.
	r := b minus: 12 with: 3.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: 9.

	b := SBytecodeGenerator new.
	r := b minus: 10 with: -3.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: 13.

	b := SBytecodeGenerator new.
	r := b minus: 1.5 with: 5.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: -3.5.

	b := SBytecodeGenerator new.
	r := b minus: -2 with: -4.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: 2.