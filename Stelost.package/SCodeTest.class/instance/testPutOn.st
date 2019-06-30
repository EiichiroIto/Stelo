tests-accessing
testPutOn
	| c stream |
	c := SCode basicNew.
	stream := WriteStream on: Array new.
	c putOn: stream.
	self assert: stream contents isEmpty.