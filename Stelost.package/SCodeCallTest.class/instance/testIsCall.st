test
testIsCall
	| c |
	c := SCodeCall subName: 'abc'.
	self assert: c isCall.