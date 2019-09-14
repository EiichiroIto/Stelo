scratch processes/events
runSetup
	self setupEvents.
	process := sworld newProcess program: self program.
	process startup.
	^ process