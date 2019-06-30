tests-private
testLabelArrayFor
	| b arr |
	b := SBytecodeGenerator new.
	b appendLabel: b privLabelId newNo.
	b appendValue: 1.
	b appendValue: 2.
	b appendLabel: b privLabelId newNo.
	b appendSymbol: #a.
	b appendLabel: b privLabelId newNo.
	b appendValue: 2.
	b appendSymbol: #a withJump: 1.

	arr := b labelArrayFor: b privStream contents.

	self assertCollection: arr equals: #(1 3 4).