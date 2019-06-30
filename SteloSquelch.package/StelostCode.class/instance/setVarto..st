variable ops
setVarto: aMorph
	| v num |
	aMorph ifNil: [ ^ self ].
	v := targetMorph varId varNoFor: aMorph variable.
	num := [ aMorph blockArgs second argString: parser ].
	bcGenerator setVar: v to: num.