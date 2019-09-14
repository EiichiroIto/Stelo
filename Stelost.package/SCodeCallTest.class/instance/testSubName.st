test
testSubName
	| c |
	c := SCodeCall subName: 'abc'.
	self assert: c subName equals: 'abc'.
	c subName: 'def'.
	self assert: c subName equals: 'def'.
	c subName: 'ghi'.
	self assert: c subName equals: 'ghi'.