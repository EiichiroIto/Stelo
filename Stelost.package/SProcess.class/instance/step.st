accessing
step
	self isRunning
		ifFalse: [ ^ self ].
	world clearRaisedEvents.
	[ self doOneCycle ] whileTrue.
	self isRunning
		ifFalse: [ ^ self ].
	self perform: transition.