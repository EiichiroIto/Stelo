tests-arithmetic ops
testPlusAnd
	| t b r |
	b := SBytecodeGenerator new.
	r := b plus: 12 and: 3.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: 15.

	b := SBytecodeGenerator new.
	r := b plus: 10 and: -3.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: 7.

	b := SBytecodeGenerator new.
	r := b plus: 1.5 and: 5.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: 6.5.

	b := SBytecodeGenerator new.
	r := b plus: -2 and: -4.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: -6.