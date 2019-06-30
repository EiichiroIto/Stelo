patch ops
setPatchVar: var x: x y: y to: aNumber
	self appendValue: x.
	self appendSymbol: #getX.
	self appendSymbol: #plus.
	self appendValue: y.
	self appendSymbol: #getY.
	self appendSymbol: #plus.
	self appendSymbol: #patchAt.
	self appendValue: aNumber.
	self appendValue: var.
	self appendValue: SBreedId patchBreedNo.
	self appendSymbol: #setBreedVarTo.