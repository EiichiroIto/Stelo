test
testSubNameAddress
	| c |
	c := SCodeCall subName: 'abc' address: 123.
	self assert: c subName equals: 'abc'.
	self assert: c address equals: 123.
	c := SCodeCall subName: 'def' address: 456.
	self assert: c subName equals: 'def'.
	self assert: c address equals: 456.