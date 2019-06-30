variable ops
setPatchVarxyto: aMorph
	| v x y num |
	aMorph ifNil: [ ^ self ].
	v := targetMorph patchVarId varNoFor: aMorph blockArgs first choice.
	x := [ aMorph blockArgs second argString: parser ].
	y := [ aMorph blockArgs third argString: parser ].
	num := [ aMorph blockArgs fourth argString: parser ].
	bcGenerator setPatchVar: v x: x y: y to: num.