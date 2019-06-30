misc ops
distanceToXy: aMorph
	| x y |
	x := [ aMorph blockArgs first argString: parser ].
	y := [ aMorph blockArgs second argString: parser ].
	^ bcGenerator distanceToX: x y: y