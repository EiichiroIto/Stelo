tests-private
testWriteVariableBreed
	| c s |
	c := SCppExporter new.
	s := WriteStream on: ''.
	c privStream: s.
	c writeVariable: 'abc' breed: 1.
	self assert: s contents equals: ('  world->addVariable(1, "abc");
' replaceAll: Character cr with: Character lf).