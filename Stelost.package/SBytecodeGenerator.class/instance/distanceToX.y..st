misc ops
distanceToX: x y: y
	self appendValue: x.
	self appendSymbol: #getX.
	self appendSymbol: #minus.
	self appendSymbol: #dup.
	self appendSymbol: #mul.
	self appendValue: y.
	self appendSymbol: #getY.
	self appendSymbol: #minus.
	self appendSymbol: #dup.
	self appendSymbol: #mul.
	self appendSymbol: #plus.
	self appendSymbol: #sqrt.
	^ nil