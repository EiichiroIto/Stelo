tests-misc ops
testDec
	| t |
	t := SThread sworld: SMicroWorld new.
	t push: 10.
	self assert: t stack first equals: 10.
	t dec.
	self assert: t stack first equals: 9.
	t dec.
	self assert: t stack first equals: 8.