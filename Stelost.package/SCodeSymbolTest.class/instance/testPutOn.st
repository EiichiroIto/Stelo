tests-accessing
testPutOn
	| c stream |
	c := SCodeSymbol selector: #abc.
	stream := WriteStream on: Array new.
	c putOn: stream.
	self assertCollection: stream contents equals: #(abc).