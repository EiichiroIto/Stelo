scratch processes/events
setupEvent: aHatBlock program: aProgram for: aMorph table: aDictionary
	| code addr |
	events
		at: aHatBlock eventName asSymbol
		ifPresent: [ :eventNo | 
			addr := aProgram nextAddress.
			code := StelostCode new
				startAddress: addr;
				subTable: aDictionary;
				parse: aHatBlock target: aMorph.
			aProgram
				addCode: code;
				addEntryPoint: addr eventNo: eventNo breedNo: aMorph breedNo ]