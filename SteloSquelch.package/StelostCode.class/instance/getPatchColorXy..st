color ops
getPatchColorXy: aMorph
	| x y |
	x := [ aMorph blockArgs first argString: parser ].
	y := [ aMorph blockArgs second argString: parser ].
	^ bcGenerator getPatchColorX: x y: y