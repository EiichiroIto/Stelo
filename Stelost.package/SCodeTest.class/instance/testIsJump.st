tests-testing
testIsJump
	| c |
	c := SCode basicNew.
	self deny: c isJump.