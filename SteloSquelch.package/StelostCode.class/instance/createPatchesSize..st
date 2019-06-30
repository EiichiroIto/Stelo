observer ops
createPatchesSize: aMorph
	| size |
	size := aMorph blockArgs first argString: parser.
	bcGenerator createPatchesSize: size.