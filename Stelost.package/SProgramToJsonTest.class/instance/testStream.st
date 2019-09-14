test
testStream
	| j |
	j := SProgramToJson new.
	self assert: j stream class equals: WriteStream.