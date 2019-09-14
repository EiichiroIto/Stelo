tests-arithmetic ops
testTruncated
	| t |
	t := SThread sworld: SMicroWorld new.
	t push: 1.4.
	self assert: t stack size equals: 1.
	t truncated.
	self assert: t stack size equals: 1.
	self assert: t pop equals: 1.
	t push: 1.5.
	self assert: t stack size equals: 1.
	t truncated.
	self assert: t stack size equals: 1.
	self assert: t pop equals: 1.
	t push: -1.5.
	self assert: t stack size equals: 1.
	t truncated.
	self assert: t stack size equals: 1.
	self assert: t pop equals: -1.