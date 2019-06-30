private
writeMorph: aMorph
	stream nextPut: ${.
	self writeBreedNo: aMorph breedNo.
	self writeVariables: aMorph varNames.
	self writeHatBlocks: aMorph hatBlocks for: aMorph.
	stream nextPut: $}.