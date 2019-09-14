tests-private
testAddressOfSubName
	| b d |
	b := SBytecodeGenerator new.
	self should: [ b addressOfSubName: 'abc' ] raise: Error.
	d := Dictionary new.
	b subTable: d.
	self should: [ b addressOfSubName: 'abc' ] raise: Error.
	d at: 'abc' put: 123.
	d at: 'def' put: 456.
	self assert: (b addressOfSubName: 'abc') equals: 123.
	self assert: (b addressOfSubName: 'def') equals: 456.