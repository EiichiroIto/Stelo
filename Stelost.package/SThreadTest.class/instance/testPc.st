tests-accessing
testPc
	| e |
	e := SThread microworld: SMicroWorld new.
	self assert: e pc equals: 1.