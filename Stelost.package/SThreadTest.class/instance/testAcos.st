tests-arithmetic ops
testAcos
	| t |
	t := SThread sworld: SMicroWorld new.
	t push: 0.5.
	self assert: t stack size equals: 1.
	t acos.
	self assert: t stack size equals: 1.
	self assert: t pop closeTo: 60.
	t push: -10.
	self assert: t stack size equals: 1.
	t acos.
	self assert: t stack size equals: 1.
	self assert: t pop closeTo: 180.