tests-accessing
testCodeSize
	| c |
	c := SCodeLabel id: 1.
	self assert: c codeSize equals: 0.