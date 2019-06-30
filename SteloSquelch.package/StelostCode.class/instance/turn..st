turtle  ops
turn: aMorph
	| num |
	num := aMorph blockArgs first argString: parser.
	bcGenerator turn: num.