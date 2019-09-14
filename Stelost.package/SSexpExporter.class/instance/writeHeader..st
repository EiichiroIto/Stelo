private
writeHeader: aMorph
	stream nextPutAll: '(stelo ('.
	aMorph frameMorph breedNames do: [ :each | stream nextPut: Character space; nextPutAll: each ].
	stream nextPut: $).
	stream nextPut: Character lf.
	stream nextPut: $(.