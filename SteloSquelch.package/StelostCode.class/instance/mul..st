arithmetic ops
mul: aMorph
	| arg1 arg2  |
	arg1 := [ aMorph blockArgs first argString: parser ].
	arg2 := [ aMorph blockArgs second argString: parser ].
	^ bcGenerator multiply: arg1 and: arg2