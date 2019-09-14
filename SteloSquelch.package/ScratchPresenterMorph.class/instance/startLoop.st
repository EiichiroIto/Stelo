button actions
startLoop
	frame ifNotNil: [ frame startLoop ].
	flagButton on.
	steloDisplay changed.
	World displayWorldSafely.
	(Delay forMilliseconds: 20) wait.