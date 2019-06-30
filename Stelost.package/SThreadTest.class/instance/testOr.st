tests-arithmetic ops
testOr
	| t |
	t := SThread microworld: SMicroWorld new.
	t push: false.
	t push: false.
	self assert: t stack size equals: 2.
	t or.
	self assert: t stack size equals: 1.
	self assert: t stack first equals: false.
	t pop.
	t push: false.
	t push: true.
	self assert: t stack size equals: 2.
	t or.
	self assert: t stack size equals: 1.
	self assert: t pop equals: true.
	t push: true.
	t push: false.
	self assert: t stack size equals: 2.
	t or.
	self assert: t stack size equals: 1.
	self assert: t pop equals: true.
	t push: true.
	t push: true.
	self assert: t stack size equals: 2.
	t or.
	self assert: t stack size equals: 1.
	self assert: t pop equals: true.