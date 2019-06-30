other ops
stopAll
	"Stop everything!"

	| stage |
	stage := self meOrOwnerThatIsA: SteloStageMorph.
	stage ifNotNil: [stage stopAll].
