turtle  ops
changeYposBy: aMorph
	| num |
	num := aMorph blockArgs first argString: parser.
	bcGenerator changeYposBy: num.