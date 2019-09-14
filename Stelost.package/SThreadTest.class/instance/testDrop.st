tests-misc ops
testDrop
	| t |
	t := SThread sworld: SMicroWorld.
	self assert: t stack size equals: 0.
	t push: 10.
	self assert: t stack size equals: 1.
	t drop.
	self assert: t stack size equals: 0.