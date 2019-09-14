tests-private
testAppendCall
	| b r |
	b := SBytecodeGenerator new.
	b subTable: { 'def'->123 } asDictionary.
	self assert: b privStream contents isEmpty.
	b appendCall: 'def'.
	self assert: b privStream contents size equals: 1.
	r := b privStream contents first.
	self assert: r class equals: SCodeCall.
	self assert: r subName equals: 'def'.
	self assert: r address equals: 123.