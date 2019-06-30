tests-private
testWriteHeader
	| j s |
	j := SJsonExporter new.
	s := WriteStream on: ''.
	j privStream: s.
	j privTitle: ''.
	j writeHeader.
	self assert: s contents equals: '{"title":"","breeds":['.
	j := SJsonExporter new.
	s := WriteStream on: ''.
	j privStream: s.
	j privTitle: 'abc'.
	j writeHeader.
	self assert: s contents equals: '{"title":"abc","breeds":['.