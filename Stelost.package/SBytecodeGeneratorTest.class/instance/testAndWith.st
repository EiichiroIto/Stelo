tests-arithmetic ops
testAndWith
	| t b r |
	b := SBytecodeGenerator new.
	r := b and: true with: true.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code).

	b := SBytecodeGenerator new.
	r := b and: true with: false.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self deny: (t evaluate: b code).

	b := SBytecodeGenerator new.
	r := b and: false with: true.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self deny: (t evaluate: b code).

	b := SBytecodeGenerator new.
	r := b and: false with: false.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self deny: (t evaluate: b code).