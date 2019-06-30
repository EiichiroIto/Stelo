tests-private
testNullaryCommand
	| b r |
	b := SBytecodeGenerator new.
	self assert: b privStream contents isEmpty.
	b nullaryCommand: #abc.
	self assert: b privStream contents size equals: 1.
	r := b privStream contents first.
	self assert: r class equals: SCodeSymbol.
	self assert: r selector equals: #abc.