scratch processes/events
runLoop
	self setupEvents.
	process := sworld newProcess program: self program.
	process loop.
	^ process