private
generateEntry: aCollection eventNo: anInteger
	aCollection
		do: [ :each | 
			stream
				nextPutAll: '{"event":';
				nextPutAll: anInteger asString;
				nextPutAll: ',"address":';
				nextPutAll: each asString;
				nextPut: $} ]
		separatedBy: [ stream nextPut: $, ]