tests-private
testAppendSymbol
	| b r |
	b := SBytecodeGenerator new.
	self assert: b privStream contents isEmpty.
	b appendSymbol: #abc.
	b appendSymbol: #def.
	self assert: b privStream contents size equals: 2.
	r := b privStream contents first.
	self assert: r class equals: SCodeSymbol.
	self assert: r selector equals: #abc.
	r := b privStream contents second.
	self assert: r class equals: SCodeSymbol.
	self assert: r selector equals: #def.