private
appendCall: aString
	stream
		nextPut: (SCodeCall subName: aString address: (self addressOfSubName: aString))