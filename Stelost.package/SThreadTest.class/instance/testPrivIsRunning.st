tests-testing
testPrivIsRunning
	| t |
	t := SThread sworld: SMicroWorld new.
	self assert: t isRunning equals: false.
	t privIsRunning: true.
	self assert: t isRunning equals: true.
	t privIsRunning: false.
	self assert: t isRunning equals: false.