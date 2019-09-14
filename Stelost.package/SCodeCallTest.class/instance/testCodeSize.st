test
testCodeSize
	| c |
	c := SCodeCall subName: 'abc'.
	self assert: c codeSize equals: 4.