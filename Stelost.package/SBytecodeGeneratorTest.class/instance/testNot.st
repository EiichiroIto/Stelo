tests-arithmetic ops
testNot
	| t b r |
	b := SBytecodeGenerator new.
	r := b not: true.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self deny: (t evaluate: b code).

	b := SBytecodeGenerator new.
	r := b not: false.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code).