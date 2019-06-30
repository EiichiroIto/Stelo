private
writeCodes: aCollection
	aCollection
		do: [ :each | 
			stream nextPut: $".
			each isString
				ifTrue: [ stream
						nextPut: $*;
						nextPutAll: (SThread indexOfSymbol: each) asString ]
				ifFalse: [ stream nextPutAll: each asString ].
			stream nextPut: $" ]
		separatedBy: [ stream nextPutAll: ',' ]