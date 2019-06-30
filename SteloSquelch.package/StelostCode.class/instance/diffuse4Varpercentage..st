observer ops
diffuse4Varpercentage: aMorph
	| v percentage |
	v := aMorph blockArgs first choice.
	v isEmpty ifTrue: [ ^ self ].
	v := targetMorph patchVarId varNoFor: v.
	percentage := [ aMorph blockArgs second argString: parser ].
	bcGenerator diffuse4Var: v percentage: percentage.