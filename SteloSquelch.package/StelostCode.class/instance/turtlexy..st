misc ops
turtlexy: aMorph
	| bid x y |
	bid := [ aMorph blockArgs first argString: parser ].
	x := [ aMorph blockArgs second argString: parser ].
	y := [ aMorph blockArgs third argString: parser ].
	^ bcGenerator turtle: bid x: x y: y