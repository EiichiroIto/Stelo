tests-arithmetic ops
testComputeFunctionOf
	| t b r |
	b := SBytecodeGenerator new.
	r := b computeFunction: #abs of: -1.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 1.

	b := SBytecodeGenerator new.
	r := b computeFunction: #abs of: 10.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 10.

	b := SBytecodeGenerator new.
	r := b computeFunction: #sqrt of: 2.
	self assert: r isNil.
	t := SThread sworld: SMicroWorld new.
	t codes: b code.
	self assert: (t evaluate: 1) equals: 2 sqrt.