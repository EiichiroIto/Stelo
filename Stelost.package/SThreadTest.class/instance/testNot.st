tests-arithmetic ops
testNot
	| t |
	t := SThread sworld: SMicroWorld new.
	t push: false.
	self assert: t stack size equals: 1.
	t not.
	self assert: t stack size equals: 1.
	self assert: t pop equals: 1.
	t push: true.
	self assert: t stack size equals: 1.
	t not.
	self assert: t stack size equals: 1.
	self assert: t pop equals: 0.