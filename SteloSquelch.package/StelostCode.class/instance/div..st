arithmetic ops
div: aMorph
	| arg1 arg2  |
	arg1 := [ aMorph blockArgs first argString: parser ].
	arg2 := [ aMorph blockArgs second argString: parser ].
	^ bcGenerator divide: arg1 by: arg2