turtle  ops
aimHigh: aMorph
	| v |
	v := aMorph blockArgs first choice.
	v isEmpty ifTrue: [ ^ self ].
	v := targetMorph patchVarId varNoFor: v.
	^ bcGenerator aimHighVar: v