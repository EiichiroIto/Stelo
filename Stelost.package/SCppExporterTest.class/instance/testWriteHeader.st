tests-private
testWriteHeader
	| c s |
	c := SCppExporter new.
	s := WriteStream on: ''.
	c privStream: s.
	c writeHeader.
	self assert: s contents equals: ('SProgram *makeProgram(SMicroWorld *world)
{
  SProgram *program = new SProgram;
' replaceAll: Character cr with: Character lf).