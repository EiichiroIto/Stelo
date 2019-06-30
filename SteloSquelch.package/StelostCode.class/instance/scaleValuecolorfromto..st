color ops
scaleValuecolorfromto: aMorph
	| v c f t |
	v := aMorph blockArgs first choice.
	v isEmpty ifTrue: [ ^ self ].
	v := targetMorph varId varNoFor: v.
	c := [ aMorph blockArgs second argString: parser ].
	f := [ aMorph blockArgs third argString: parser ].
	t := [ aMorph blockArgs fourth argString: parser ].
	bcGenerator scaleValue: v color: c from: f to: t.