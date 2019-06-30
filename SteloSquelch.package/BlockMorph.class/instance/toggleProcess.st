processes
toggleProcess
	self workPane
		ifNotNil: [ :stage | 
			stage isProcessRunning
				ifTrue: [ self stop ]
				ifFalse: [ self start ] ].