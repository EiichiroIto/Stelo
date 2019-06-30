transitions
afterStartup
	world raisedEvents notEmpty
		ifTrue: [ self startupCont ]
		ifFalse: [ self setup ]