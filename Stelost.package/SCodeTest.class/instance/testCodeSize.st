tests-accessing
testCodeSize
	| c |
	c := SCode basicNew.
	self assert: c codeSize equals: 1.