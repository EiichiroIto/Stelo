tests-printing
testPrintOn
	| ts |
	ts := STurtles new breedId: 3.
	self assert: ts asString equals: 'Turtles(0)'.
	ts create: 10.
	self assert: ts asString equals: 'Turtles(10)'.