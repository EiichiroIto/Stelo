private
generateEntries: aDictionary
	stream nextPutAll: ',"entries":['.
	aDictionary keys sort
		do:
			[ :eno | self generateEntry: (aDictionary at: eno) eventNo: eno ]
		separatedBy: [ stream nextPut: $, ].
	stream nextPutAll: ']'