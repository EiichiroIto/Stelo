tests-private
testAppendLabel
	| b r |
	b := SBytecodeGenerator new.
	self assert: b privStream contents isEmpty.
	b appendLabel: 123.
	b appendLabel: 456.
	self assert: b privStream contents size equals: 2.
	r := b privStream contents first.
	self assert: r class equals: SCodeLabel.
	self assert: r id equals: 123.
	r := b privStream contents second.
	self assert: r class equals: SCodeLabel.
	self assert: r id equals: 456.