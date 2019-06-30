tests-private
testWriteCodes
	| c s |
	c := SCppExporter new.
	s := WriteStream on: ''.
	c privStream: s.
	c writeCodes: #(abc 1 -2 def 3).
	self assert: s contents equals: ('  code.addSymbol(SS_abc);
  code.addFloat(1);
  code.addFloat(-2);
  code.addSymbol(SS_def);
  code.addFloat(3);
' replaceAll: Character cr with: Character lf).