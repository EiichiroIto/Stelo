tests-testing
testIsLabel
	| c |
	c := SCode basicNew.
	self assert: c isLabel not.