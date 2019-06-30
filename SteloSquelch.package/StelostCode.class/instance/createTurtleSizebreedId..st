observer ops
createTurtleSizebreedId: aMorph
	| size bid |
	size := [ aMorph blockArgs first argString: parser ].
	bid := [ aMorph blockArgs second argString: parser ].
	bcGenerator createTurtleSize: size breedId: bid.