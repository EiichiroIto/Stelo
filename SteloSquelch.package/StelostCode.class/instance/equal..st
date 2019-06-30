arithmetic ops
equal: aMorph
	| arg1 arg2  |
	arg1 := [ aMorph blockArgs first argString: parser ].
	arg2 := [ aMorph blockArgs second argString: parser ].
	^ bcGenerator equal: arg1 to: arg2