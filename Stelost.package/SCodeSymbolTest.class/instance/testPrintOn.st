tests-printing
testPrintOn
	| c |
	c := SCodeSymbol selector: #abc.
	self assert: c asString equals: '<symbol=abc>'.