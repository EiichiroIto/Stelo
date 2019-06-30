patch ops
setPatchColorX: x y: y to: aNumber
	self appendValue: x.
	self appendSymbol: #getX.
	self appendSymbol: #plus.
	self appendValue: y.
	self appendSymbol: #getY.
	self appendSymbol: #plus.
	self appendSymbol: #patchAt.
	self appendValue: aNumber.
	self appendSymbol: #setPatchColorTo.