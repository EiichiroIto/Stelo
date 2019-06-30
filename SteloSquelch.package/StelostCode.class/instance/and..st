arithmetic ops
and: aMorph
	| arg1 arg2  |
	arg1 := [ aMorph blockArgs first argString: parser ].
	arg2 := [ aMorph blockArgs second argString: parser ].
	^ bcGenerator and: arg1 with: arg2