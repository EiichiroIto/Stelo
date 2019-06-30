tests-private
testWriteFooter
	| j s |
	j := SJsonExporter new.
	s := WriteStream on: ''.
	j privStream: s.
	j writeFooter.
	self assert: s contents equals: ']}'.