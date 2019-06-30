variable ops
getVar: aMorph
	| v |
	aMorph ifNil: [ ^ self ].
	v := targetMorph varId varNoFor: aMorph variable.
	^ bcGenerator getVar: v