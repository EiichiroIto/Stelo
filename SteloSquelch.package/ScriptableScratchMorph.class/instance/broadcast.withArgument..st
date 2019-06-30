other ops
broadcast: name withArgument: arg
	"Broadcast the given event with the given argument."

	| stage |
	(stage := self meOrOwnerThatIsA: SteloStageMorph) ifNotNil: [
		stage broadcastEventNamed: name asString with: arg].
