misc ops
directionToXy: aMorph
	| x y |
	x := [ aMorph blockArgs first argString: parser ].
	y := [ aMorph blockArgs second argString: parser ].
	^ bcGenerator directionToX: x y: y