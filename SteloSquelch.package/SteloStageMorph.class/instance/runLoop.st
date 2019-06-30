scratch processes/events
runLoop
	self setupEvents.
	process := SProcess microworld: microworld program: self program.
	process loop.
	^ process