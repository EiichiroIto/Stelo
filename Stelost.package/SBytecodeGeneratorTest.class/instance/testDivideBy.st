tests-arithmetic ops
testDivideBy
	| t b r |
	b := SBytecodeGenerator new.
	r := b divide: 100 by: 2.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: 50.

	b := SBytecodeGenerator new.
	r := b divide: 12 by: 3.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: 4.

	b := SBytecodeGenerator new.
	r := b divide: 10 by: -2.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: -5.

	b := SBytecodeGenerator new.
	r := b divide: 1 by: 5.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: 0.2.

	b := SBytecodeGenerator new.
	r := b divide: 2 by: -4.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: -0.5.