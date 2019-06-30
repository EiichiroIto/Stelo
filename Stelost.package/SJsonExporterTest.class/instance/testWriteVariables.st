tests-private
testWriteVariables
	| j s |
	j := SJsonExporter new.
	s := WriteStream on: ''.
	j privStream: s.
	j writeVariables: #(ab cde).
	self assert: s contents equals: '"variables":["ab","cde"],'