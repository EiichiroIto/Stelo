tests-testing
testIsJump
	| c |
	c := SCodeSymbolWithJump selector: #abc labelId: 1.
	self assert: c isJump.