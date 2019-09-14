accessing
breedOf: anInteger
	^ ({self} , sprites collect: #breed)
		detect: [ :each | each breedNo = anInteger ]
		ifNone: [ nil ]