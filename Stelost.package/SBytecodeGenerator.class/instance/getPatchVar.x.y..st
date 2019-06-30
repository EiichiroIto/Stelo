patch ops
getPatchVar: vid x: x y: y
	self appendValue: x.
	self appendSymbol: #getX.
	self appendSymbol: #plus.
	self appendValue: y.
	self appendSymbol: #getY.
	self appendSymbol: #plus.
	self appendSymbol: #patchAt.
	self appendValue: vid.
	self appendValue: SBreedId patchBreedNo.
	self appendSymbol: #getBreedVar.
	^ nil