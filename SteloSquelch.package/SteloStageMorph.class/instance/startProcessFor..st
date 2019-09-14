scratch processes/events
startProcessFor: topBlock
	| code program sFrame target |
	self stopAllProcesses.
	self setupEvents.
	sFrame := self frameMorph.
	sFrame ifNil: [ ^ self ].
	target := sFrame viewerPane target.
	code := StelostCode new parse: topBlock target: target.
	program := SProgram new.
	program
		addCode: code;
		addEntryPoint: 1
			eventNo: SEventId singleEventNo
			breedNo: topBlock receiver breedNo.
	process := sworld newProcess program: program.
	process single.
	^ process