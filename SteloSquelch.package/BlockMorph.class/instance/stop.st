processes
stop
	self workPane ifNotNil: [ :stage | stage stopAllProcesses ].