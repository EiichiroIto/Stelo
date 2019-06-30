tests-printing
testPrintOn
	| c |
	c := SCodeValue data: 123.
	self assert: c asString equals: '<value=123>'.