blocks
hatBlockType: blockType

	| stage evtName |
	'E' = blockType ifTrue: [
		evtName := ''.
		(stage := self meOrOwnerThatIsA: SteloStageMorph)
			ifNotNil: [evtName := stage defaultEventName].
		^ EventHatMorph new scriptOwner: self; eventName: evtName].

	'S' = blockType ifTrue: [^ EventHatMorph new forSetupEvent scriptOwner: self].
	'T' = blockType ifTrue: [^ EventHatMorph new forStartupEvent scriptOwner: self].
	'L' = blockType ifTrue: [^ EventHatMorph new forLoopEvent scriptOwner: self].
