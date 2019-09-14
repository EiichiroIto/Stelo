menu/button ops
addSubBlock: aPosition
	| subName scriptsMorph morph |
	subName := StringDialog ask: 'Sub name?'.
	subName isEmpty
		ifTrue: [ ^ self ].
	morph := SubHatMorph new
		position: aPosition;
		subName: subName;
		newScriptOwner: self target.
	scriptsMorph := (pageViewerMorph allMorphs
		select: [ :m | m isKindOf: ScratchScriptsMorph ]) first.
	scriptsMorph addMorph: morph