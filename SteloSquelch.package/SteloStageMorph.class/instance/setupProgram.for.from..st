scratch processes/events
setupProgram: aProgram for: aMorph from: aCollection
	aCollection
		do: [ :each | 
			events
				at: each eventName asSymbol
				ifPresent: [ :eventNo | 
					| code |
					code := StelostCode new parse: each target: aMorph.
					(aProgram forEventNo: eventNo) addCodes: code forBreedNo: aMorph breedNo ] ]