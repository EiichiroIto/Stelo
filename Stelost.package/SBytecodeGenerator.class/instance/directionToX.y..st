misc ops
directionToX: x y: y
	self appendValue: x.
	self appendSymbol: #getX.
	self appendSymbol: #minus.
	self appendValue: y.
	self appendSymbol: #getY.
	self appendSymbol: #minus.
	self appendSymbol: #direction.
	^ nil