tests-accessing
testPutOn
	| c stream |
	c := SCodeLabel id: 1.
	stream := WriteStream on: Array new.
	c putOn: stream.
	self assert: stream contents isEmpty.