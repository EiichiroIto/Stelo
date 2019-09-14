tests-private
testPush
	| e |
	e := SThread sworld: SMicroWorld new.
	self assert: e stack isEmpty.
	e push: 10.
	e push: 20.
	self assert: e stack size equals: 2.
	self assertCollection: e stack asArray equals: #(10 20).