tests-misc ops
testPush1
	| e |
	e := SThread sworld: SMicroWorld new.
	self assert: e stack isEmpty.
	e push1.
	self assert: e stack size equals: 1.
	self assertCollection: e stack asArray equals: #(1).
	e push1.
	self assert: e stack size equals: 2.
	self assertCollection: e stack asArray equals: #(1 1).