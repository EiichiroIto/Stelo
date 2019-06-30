turtle  ops
forward: aMorph
	| num |
	num := aMorph blockArgs first argString: parser.
	bcGenerator forward: num.