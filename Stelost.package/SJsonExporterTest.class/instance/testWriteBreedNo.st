tests-private
testWriteBreedNo
	| j s |
	j := SJsonExporter new.
	s := WriteStream on: ''.
	j privStream: s.
	j writeBreedNo: 123.
	self assert: s contents equals: '"breed":123,'.