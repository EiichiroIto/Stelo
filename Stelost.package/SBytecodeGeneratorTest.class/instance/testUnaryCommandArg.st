tests-private
testUnaryCommandArg
	| b r |
	b := SBytecodeGenerator new.
	self assert: b privStream contents isEmpty.
	b unaryCommand: #abc arg: 123.
	self assert: b privStream contents size equals: 2.
	r := b privStream contents first.
	self assert: r class equals: SCodeValue.
	self assert: r data equals: 123.
	r := b privStream contents second.
	self assert: r class equals: SCodeSymbol.
	self assert: r selector equals: #abc.