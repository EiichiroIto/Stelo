tests-accessing
testLabelId
	| c |
	c := SCodeSymbolWithJump selector: #abc labelId: 1.
	self assert: c labelId equals: 1.
	c labelId: 123.
	self assert: c labelId equals: 123.