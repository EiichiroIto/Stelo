tests-private
testResolveJumpAddressUsing
	| b fp arr |
	b := SBytecodeGenerator new.
	b appendLabel: b privLabelId newNo.
	b appendValue: 1.
	b appendValue: 2.
	b appendSymbol: #a withJump: 3.
	b appendLabel: b privLabelId newNo.
	b appendSymbol: #b.
	b appendLabel: b privLabelId newNo.
	b appendValue: 2.
	b appendSymbol: #c withJump: 2.
	fp := b privStream contents.

	self assert: (fp at: 4) address equals: nil.
	self assert: (fp at: 9) address equals: nil.

	arr := b labelArrayFor: fp.
	b resolveJumpAddress: fp using: arr.

	self assert: (fp at: 4) address equals: 6.
	self assert: (fp at: 9) address equals: 5.