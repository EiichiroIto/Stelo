tests-control ops
testStopAll
	| t |
	t := SThread microworld: SMicroWorld new.
	t codes: #(1 2 3).
	self assert: t pc equals: 1.
	t stopAll.
	self assert: t pc equals: 4.
	self assert: t isTerminated equals: true.