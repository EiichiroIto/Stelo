scripts
duplicate

	| newSprite |
	newSprite := self duplicateNoAttach.
	self world activeHand attachMorph: newSprite.

	"((s := self meOrOwnerThatIsA: SteloStageMorph) notNil and:
	 [s isQuarterSize]) ifTrue: [
		self world activeHand drawHalfSize: true]."

	^ newSprite
