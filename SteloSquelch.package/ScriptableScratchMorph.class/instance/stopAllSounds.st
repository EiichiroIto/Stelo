other ops
stopAllSounds
	"Stop all sounds and MIDI notes/drums."

	| stage |
	stage := self meOrOwnerThatIsA: SteloStageMorph.
	stage ifNotNil: [stage stopAllSounds].
