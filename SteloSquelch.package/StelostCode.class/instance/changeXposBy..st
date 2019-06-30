turtle  ops
changeXposBy: aMorph
	| num |
	num := aMorph blockArgs first argString: parser.
	bcGenerator changeXposBy: num.