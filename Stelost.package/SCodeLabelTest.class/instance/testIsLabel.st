tests-testing
testIsLabel
	| c |
	c := SCodeLabel id: 1.
	self assert: c isLabel.