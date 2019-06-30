observer ops
multiplyVarby: aMorph
	| v percentage |
	v := aMorph blockArgs first choice.
	v isEmpty ifTrue: [ ^ self ].
	v := targetMorph patchVarId varNoFor: v.
	percentage := [ aMorph blockArgs second argString: parser ].
	bcGenerator multiplyVar: v by: percentage.