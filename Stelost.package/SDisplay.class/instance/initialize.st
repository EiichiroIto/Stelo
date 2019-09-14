initialization
initialize
	super initialize.
	self extent: self defaultExtent.
	self color: Color darkGray.
	forceModelChanged := true.
	info := ''.