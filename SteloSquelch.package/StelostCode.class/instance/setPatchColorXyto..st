color ops
setPatchColorXyto: aMorph
	| x y data |
	x := [ aMorph blockArgs first argString: parser ].
	y := [ aMorph blockArgs second argString: parser ].
	data := [ aMorph blockArgs third argString: parser ].
	bcGenerator setPatchColorX: x y: y to: data.