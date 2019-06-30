tests-arithmetic ops
testEqual
	| t |
	t := SThread microworld: SMicroWorld new.
	t push: 10.
	t push: 5.
	self assert: t stack size equals: 2.
	t equal.
	self assert: t stack size equals: 1.
	self assert: t pop equals: false.
	t push: -10.
	t push: -10.
	self assert: t stack size equals: 2.
	t equal.
	self assert: t stack size equals: 1.
	self assert: t pop equals: true.