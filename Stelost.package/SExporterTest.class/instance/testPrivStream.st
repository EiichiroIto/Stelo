tests-private
testPrivStream
	| e s |
	e := SExporter new.
	self assert: e privStream isNil.
	s := WriteStream on: ''.
	e privStream: s.
	self assert: e privStream equals: s.