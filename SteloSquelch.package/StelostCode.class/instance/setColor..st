color ops
setColor: aMorph
	| c |
	c := [ aMorph blockArgs first argString: parser ].
	bcGenerator setColorTo: c.