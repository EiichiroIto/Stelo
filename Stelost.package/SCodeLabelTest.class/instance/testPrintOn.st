tests-printing
testPrintOn
	| c |
	c := SCodeLabel id: 1.
	self assert: c asString equals: '<label=1>'.