tests-accessing
testPutOn
	| c stream |
	c := SCodeValue data: 123.
	stream := WriteStream on: Array new.
	c putOn: stream.
	self assertCollection: stream contents equals: #(123).