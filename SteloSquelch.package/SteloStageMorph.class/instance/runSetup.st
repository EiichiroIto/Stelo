scratch processes/events
runSetup
	self setupEvents.
	process := SProcess microworld: microworld program: self program.
	process startup.
	^ process