scratch processes/events
setupSub: aHatBlock program: aProgram for: aMorph table: aDictionary
	| code addr |
	addr := aProgram nextAddress.
	code := StelostCode new
		startAddress: addr;
		subTable: aDictionary;
		parse: aHatBlock target: aMorph.
	aProgram addCode: code.
	aDictionary at: aHatBlock subName put: addr