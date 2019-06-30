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
	(program forEventNo: SEventId singleEventNo)
		addCodes: code
		forBreedNo: topBlock receiver breedNo.
	process := SProcess microworld: microworld program: program.
	process single.
	^ process