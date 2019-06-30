arithmetic ops
isbetweenand: aMorph
	| args a f t |
	args := aMorph blockArgs.
	a := [ args first argString: parser ].
	f := [ args second argString: parser ].
	t := [ args third argString: parser ].
	^ bcGenerator is: a between: f and: t