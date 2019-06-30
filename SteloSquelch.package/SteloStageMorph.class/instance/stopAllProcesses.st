scratch processes/events
stopAllProcesses
	process ifNil: [ ^ self ].
	process stop.
	process := nil.