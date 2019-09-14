private
generateBreeds: aDictionary
	stream nextPutAll: '"breeds":['.
	aDictionary keys sort
		do: [ :bno | 
			stream
				nextPutAll: '{"breed":';
				nextPutAll: bno asString.
			self generateEntries: (aDictionary at: bno).
			stream nextPut: $} ]
		separatedBy: [ stream nextPut: $, ].
	stream nextPutAll: ']'.