button actions
startSetup
	frame ifNotNil: [ frame startSetup ].
	flagButton on.
	World displayWorldSafely.
	(Delay forMilliseconds: 20) wait.
	steloDisplay changed.