tests-private
testWriteFooter
	| c s |
	c := SCppExporter new.
	s := WriteStream on: ''.
	c privStream: s.
	c writeFooter.
	self assert: s contents equals: ('  return program;
}
' replaceAll: Character cr with: Character lf).