tests-variable ops
testGetId
	| t |
	t := SThread sworld: SMicroWorld new.
	t privId: 10.
	self assert: t stack size equals: 0.
	t getId.
	self assert: t pop equals: 10.