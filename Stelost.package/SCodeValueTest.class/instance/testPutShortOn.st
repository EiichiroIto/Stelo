tests-accessing
testPutShortOn
	| c stream |
	c := SCodeValue data: 123.
	stream := WriteStream on: Array new.
	c putShortOn: stream.
	self assertCollection: stream contents equals: #(pushShort 123 0).
	c := SCodeValue data: -123.
	stream := WriteStream on: Array new.
	c putShortOn: stream.
	self
		assertCollection: stream contents
		equals: #(pushShort 16r85 16rFF)