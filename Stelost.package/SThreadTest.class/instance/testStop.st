tests-control ops
testStop
	| t |
	t := SThread microworld: SMicroWorld new.
	t codes: #(1 2 3).
	self assert: t pc equals: 1.
	t stop.
	self assert: t pc equals: 4.
	self assert: t isTerminated equals: false.