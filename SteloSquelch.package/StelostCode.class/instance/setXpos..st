turtle  ops
setXpos: aMorph
	| num |
	num := aMorph blockArgs first argString: parser.
	bcGenerator setXpos: num.