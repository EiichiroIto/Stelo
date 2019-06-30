private
writeHatBlocks: aCollection for: aMorph
	stream nextPutAll: '"codes":['.
	aCollection
		do: [ :each | self writeHatBlock: each for: aMorph ]
		separatedBy: [ stream nextPut: $, ].
	stream nextPutAll: ']'