stepping
step
	stage stepProcesses.
	steloDisplay changed.
	stage isProcessRunning
		ifTrue: [ flagButton on ]
		ifFalse: [ flagButton off ].