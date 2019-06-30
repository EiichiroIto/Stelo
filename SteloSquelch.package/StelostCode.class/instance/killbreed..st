misc ops
killbreed: aMorph
	| id bid |
	id := [ aMorph blockArgs first argString: parser ].
	bid := [ aMorph blockArgs second argString: parser ].
	bcGenerator kill: id breed: bid.