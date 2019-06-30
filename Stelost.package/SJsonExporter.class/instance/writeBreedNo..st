private
writeBreedNo: anInteger
	stream
		nextPutAll: '"breed":';
		nextPutAll: anInteger asString;
		nextPut: $,.