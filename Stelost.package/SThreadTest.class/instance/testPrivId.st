tests-private
testPrivId
	| e |
	e := SThread microworld: SMicroWorld new.
	self assert: e privId isNil.
	e privId: 10.
	self assert: e privId equals: 10.
	e privId: 20.
	self assert: e privId equals: 20.