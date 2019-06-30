transitions
afterSetup
	world raisedEvents notEmpty
		ifTrue: [ self setupCont ]
		ifFalse: [ self stop ]