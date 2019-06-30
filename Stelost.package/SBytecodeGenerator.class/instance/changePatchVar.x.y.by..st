patch ops
changePatchVar: v x: x y: y by: aNumber
	self appendValue: x.
	self appendSymbol: #getX.
	self appendSymbol: #plus.
	self appendValue: y.
	self appendSymbol: #getY.
	self appendSymbol: #plus.
	self appendSymbol: #patchAt.
	self appendSymbol: #dup.
	self appendValue: v.
	self appendValue: SBreedId patchBreedNo.
	self appendSymbol: #getBreedVar.
	self appendValue: aNumber.
	self appendSymbol: #plus.
	self appendValue: v.
	self appendValue: SBreedId patchBreedNo.
	self appendSymbol: #setBreedVarTo.