turtle  ops
setYpos: aMorph
	| num |
	num := aMorph blockArgs first argString: parser.
	bcGenerator setYpos: num.