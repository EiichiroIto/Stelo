tests-control ops
testStop
	| t |
	t := SThread sworld: SMicroWorld new.
	t codes: #(1 2 3).
	self assert: t pc equals: 1.
	t stop.
	self deny: t isRunning.
	self deny: t isTerminated.