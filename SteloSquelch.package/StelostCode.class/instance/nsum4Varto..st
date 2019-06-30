observer ops
nsum4Varto: aMorph
	| v1 v2 |
	v1 := aMorph blockArgs first choice.
	v1 isEmpty ifTrue: [ ^ self ].
	v1 := targetMorph patchVarId varNoFor: v1.
	v2 := aMorph blockArgs second choice.
	v2 isEmpty ifTrue: [ ^ self ].
	v2 := targetMorph patchVarId varNoFor: v2.
	bcGenerator nsum4Var: v1 to: v2.