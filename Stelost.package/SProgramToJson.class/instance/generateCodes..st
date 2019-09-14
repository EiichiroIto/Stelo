private
generateCodes: aCollection
	stream nextPutAll: '"codes":['.
	aCollection
		do: [ :each | stream nextPutAll: each asString ]
		separatedBy: [ stream nextPut: $, ].
	stream nextPut: $]