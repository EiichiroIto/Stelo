blocks
hatBlockType: blockType
	| stage evtName subName |
	stage := self meOrOwnerThatIsA: SteloStageMorph.
	'E' = blockType
		ifTrue: [ evtName := ''.
			stage ifNotNil: [ evtName := stage defaultEventName ].
			^ EventHatMorph new
				scriptOwner: self;
				eventName: evtName ].
	'S' = blockType
		ifTrue: [ ^ EventHatMorph new forSetupEvent scriptOwner: self ].
	'T' = blockType
		ifTrue: [ ^ EventHatMorph new forStartupEvent scriptOwner: self ].
	'L' = blockType
		ifTrue: [ ^ EventHatMorph new forLoopEvent scriptOwner: self ].
	'C' = blockType
		ifTrue: [ subName := ''.
			stage ifNotNil: [ subName := stage defaultSubName ].
			^ SubHatMorph new
				scriptOwner: self;
				subName: subName ]