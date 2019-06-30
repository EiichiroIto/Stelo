instance creation
microworld: aMicroworld program: aProgram
	^ self basicNew
		initialize;
		privMicroworld: aMicroworld;
		privProgram: aProgram;
		yourself