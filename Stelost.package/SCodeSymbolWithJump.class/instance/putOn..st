accessing
putOn: aStream
	address ifNil: [ self error ].
	aStream nextPut: address.
	aStream nextPut: selector.