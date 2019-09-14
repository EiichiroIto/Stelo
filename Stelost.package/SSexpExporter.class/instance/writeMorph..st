private
writeMorph: aMorph
	| code |
	stream
		nextPutAll: '(for ';
		nextPutAll: aMorph objName;
		nextPut: Character space;
		nextPut: $(.
	aMorph varNames
		do: [ :each | 
			stream
				nextPut: Character space;
				nextPutAll: (SexpLexer quotedString: each) ].
	stream
		nextPut: $);
		nextPut: Character lf;
		nextPut: $(.
	aMorph subBlocks
		do: [ :each | 
			code := SteloSexpGenerator new parse: each target: aMorph.
			stream nextPutAll: code ].
	aMorph eventBlocks
		do: [ :each | 
			code := SteloSexpGenerator new parse: each target: aMorph.
			stream nextPutAll: code ].
	stream
		nextPutAll: '))';
		nextPut: Character lf