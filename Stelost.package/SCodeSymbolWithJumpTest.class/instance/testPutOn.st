tests-accessing
testPutOn
	| c stream |
	stream := WriteStream on: Array new.
	c := SCodeSymbolWithJump selector: #abc labelId: 1.
	self should: [ c putOn: stream ] raise: Error.
	c address: 123.
	c putOn: stream.
	self assertCollection: stream contents equals: #(pushShort 123 0 abc).