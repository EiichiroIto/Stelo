tests-misc ops
testPushShort
	| e |
	e := SThread sworld: SMicroWorld new.
	e codes: #(16r03 16r00).
	self assert: e stack isEmpty.
	e pushShort.
	self assert: e stack size equals: 1.
	self assertCollection: e stack asArray equals: #(3).
	e := SThread sworld: SMicroWorld new.
	e codes: #(16rFD 16rFF).
	self assert: e stack isEmpty.
	e pushShort.
	self assert: e stack size equals: 1.
	self assertCollection: e stack asArray equals: #(-3)