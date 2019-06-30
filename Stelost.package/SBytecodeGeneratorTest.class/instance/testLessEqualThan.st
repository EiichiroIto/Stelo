tests-arithmetic ops
testLessEqualThan
	| t b r |
	b := SBytecodeGenerator new.
	r := b lessEqual: 12 than: 3.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: false.

	b := SBytecodeGenerator new.
	r := b lessEqual: -10 than: 3.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: true.

	b := SBytecodeGenerator new.
	r := b lessEqual: 5 than: 5.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: true.

	b := SBytecodeGenerator new.
	r := b lessEqual: -2.5 than: -2.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: true.