private
writeCodes: aCollection
	aCollection
		do: [ :each | 
			each isString
				ifTrue: [ stream
						nextPutAll: '  code.addSymbol(SS_';
						nextPutAll: each;
						nextPutAll: ');' ]
				ifFalse: [ stream
						nextPutAll: '  code.addFloat(';
						nextPutAll: each asString;
						nextPutAll: ');' ].
			stream nextPutAll: String lf ]