turtle  ops
setHeading: aMorph
	| num |
	num := aMorph blockArgs first argString: parser.
	bcGenerator setHeading: num.