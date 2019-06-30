tests-accessing
testCodeSize
	| c |
	c := SCodeSymbolWithJump selector: #abc labelId: 1.
	self assert: c codeSize equals: 2.