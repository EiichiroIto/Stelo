private
spriteArgString: aMorph
	(aMorph isKindOf: ScriptableScratchMorph)
		ifFalse: [ self error ].
	^ aMorph breedNo