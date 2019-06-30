tests-arithmetic ops
testComputeFunctionOf
	| t b r |
	b := SBytecodeGenerator new.
	r := b computeFunction: #abs of: -1.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: 1.

	b := SBytecodeGenerator new.
	r := b computeFunction: #abs of: 10.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: 10.

	b := SBytecodeGenerator new.
	r := b computeFunction: #sqrt of: 2.
	self assert: r isNil.
	t := SThread microworld: SMicroWorld new.
	self assert: (t evaluate: b code) equals: 2 sqrt.