misc ops
broadcast: aMorph
	| msg |
	msg := 	aMorph blockArgs first argString: parser.
	bcGenerator broadcast: msg.