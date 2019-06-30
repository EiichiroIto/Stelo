misc ops
turtle: bid x: x y: y
	self appendValue: x.
	self appendSymbol: #getX.
	self appendSymbol: #plus.
	self appendValue: y.
	self appendSymbol: #getY.
	self appendSymbol: #plus.
	self appendValue: bid.
	self appendSymbol: #turtleAt.
	^ nil