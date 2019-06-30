scratch processes/events
stepProcesses
	process ifNil: [ ^ self ].
	process step.
	updateDisplay
		ifTrue: [ steloDisplay changed ].