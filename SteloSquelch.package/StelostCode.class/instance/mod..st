arithmetic ops
mod: aMorph
	| arg1 arg2  |
	arg1 := [ aMorph blockArgs first argString: parser ].
	arg2 := [ aMorph blockArgs second argString: parser ].
	^ bcGenerator mod: arg1 by: arg2