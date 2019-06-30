private
writeMorph: aMorph
	| code |
	aMorph varNames
		do: [ :each | self writeVariable: each breed: aMorph breedNo ].
	aMorph hatBlocks
		do: [ :each | 
			stream
				nextPutAll: '  {SEventCodes& event = program->forEvent(';
				nextPutAll: (self eventIdFor: each eventName) asString;
				nextPutAll: ');';
				nextPutAll: String lf.
			stream
				nextPutAll: '  {SCode& code = event.newCode(';
				nextPutAll: aMorph breedNo asString;
				nextPutAll: ');';
				nextPutAll: String lf.
			code := StelostCode new parse: each target: aMorph.
			self writeCodes: code.
			stream
				nextPutAll: '  }}';
				nextPutAll: String lf ]