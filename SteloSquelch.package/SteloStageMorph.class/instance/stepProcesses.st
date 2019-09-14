scratch processes/events
stepProcesses
	process ifNil: [ ^ self ].
	process step.
	self updateFps.
	updateDisplay
		ifFalse: [ ^ self ].
	steloDisplay changed