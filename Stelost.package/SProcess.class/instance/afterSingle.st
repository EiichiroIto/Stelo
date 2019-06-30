transitions
afterSingle
	world raisedEvents notEmpty
		ifTrue: [ self singleCont ]
		ifFalse: [ self stop ]