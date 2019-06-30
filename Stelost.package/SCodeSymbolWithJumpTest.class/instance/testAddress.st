tests-accessing
testAddress
	| c |
	c := SCodeSymbolWithJump selector: #abc labelId: 1.
	self assert: c address isNil.
	c address: 123.
	self assert: c address equals: 123.