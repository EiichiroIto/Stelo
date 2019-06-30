accessing
openFileNamed: aString
	self close.
	writer := GIFReadWriter on: (FileStream newFileNamed: aString).
	writer ifNil: [ ^ self ].
	writer delay: 10.
	count := 0.