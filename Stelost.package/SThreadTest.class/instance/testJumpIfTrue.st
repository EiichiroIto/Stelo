tests-control ops
testJumpIfTrue
	| t |
	t := SThread sworld: SMicroWorld new.
	t codes: #(1 2 3).
	self assert: t pc equals: 1.
	t push: false.
	t push: 5.
	self assert: t stack size equals: 2.
	t jumpIfTrue.
	self assert: t pc equals: 1.
	self assert: t stack size equals: 0.
	t push: true.
	t push: 5.
	self assert: t stack size equals: 2.
	t jumpIfTrue.
	self assert: t pc equals: 5.
	self assert: t stack size equals: 0.