transitions
afterLoop
	world raisedEvents notEmpty
		ifTrue: [ self loopCont ]
		ifFalse: [ self loop ]