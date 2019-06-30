private
writeVariables: aCollection
	stream nextPutAll: '"variables":['.
	aCollection
		do: [ :each | 
			stream
				nextPut: $";
				nextPutAll: each;
				nextPut: $" ]
		separatedBy: [ stream nextPut: $, ].
	stream nextPutAll: '],'.