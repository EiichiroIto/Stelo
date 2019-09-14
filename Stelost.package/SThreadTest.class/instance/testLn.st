tests-arithmetic ops
testLn
	| t |
	t := SThread sworld: SMicroWorld new.
	t push: 1.
	self assert: t stack size equals: 1.
	t ln.
	self assert: t stack size equals: 1.
	self assert: t pop closeTo: 0.
	t push: 2 exp.
	self assert: t stack size equals: 1.
	t ln.
	self assert: t stack size equals: 1.
	self assert: t pop closeTo: 2.
	t push: 1 / 1 exp.
	self assert: t stack size equals: 1.
	t ln.
	self assert: t stack size equals: 1.
	self assert: t pop closeTo: -1.