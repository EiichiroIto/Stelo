tests-testing
testIsLabel
	| c |
	c := SCode basicNew.
	self deny: c isLabel.