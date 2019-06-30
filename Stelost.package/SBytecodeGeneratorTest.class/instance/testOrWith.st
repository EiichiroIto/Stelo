tests-arithmetic ops
testOrWith
	| t b r |
	b := SBytecodeGenerator new.
	r := b or: true with: true.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code).

	b := SBytecodeGenerator new.
	r := b or: true with: false.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code).

	b := SBytecodeGenerator new.
	r := b or: false with: true.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code).

	b := SBytecodeGenerator new.
	r := b or: false with: false.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self deny: (t evaluate: b code).