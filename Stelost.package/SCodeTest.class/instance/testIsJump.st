tests-testing
testIsJump
	| c |
	c := SCode basicNew.
	self assert: c isJump not.