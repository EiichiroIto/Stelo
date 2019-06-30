tests-accessing
testId
	| c |
	c := SCodeLabel id: 1.
	self assert: c id equals: 1.
	c id: 20.
	self assert: c id equals: 20.