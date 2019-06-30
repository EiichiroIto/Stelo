button actions
shoutGo
	frame ifNotNil: [ frame shoutGo ].
	flagButton on.
	steloDisplay changed.
	World displayWorldSafely.
	(Delay forMilliseconds: 20) wait.