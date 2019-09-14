test
testPutShortOn
	| c stream |
	c := SCode basicNew.
	stream := WriteStream on: Array new.
	c putShort: 123 on: stream.
	self assertCollection: stream contents equals: #(pushShort 123 0).
	c := SCode basicNew.
	stream := WriteStream on: Array new.
	c putShort: -123 on: stream.
	self
		assertCollection: stream contents
		equals: #(pushShort 16r85 16rFF)