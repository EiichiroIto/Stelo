tests-private
testWriteCodes
	| j s |
	j := SJsonExporter new.
	s := WriteStream on: ''.
	j privStream: s.
	j writeCodes: {'abs' . 1 . -2 . 'aimHigh' . 3}.
	self assert: s contents equals: '"*1","1","-2","*3","3"'.