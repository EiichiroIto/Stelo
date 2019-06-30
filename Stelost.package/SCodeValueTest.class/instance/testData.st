tests-accessing
testData
	| c |
	c := SCodeValue data: 1.
	self assert: c data equals: 1.
	c data: 2.
	self assert: c data equals: 2.