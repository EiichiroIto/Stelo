accessing
fromProgram: aProgram
	self convert: aProgram.
	stream nextPut: ${.
	self generateBreeds: breeds.
	stream nextPut: $,.
	self generateCodes: aProgram bytecode.
	stream nextPut: $}.
	^ stream contents