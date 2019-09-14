tests-accessing
testStack
	| e |
	e := SThread sworld: SMicroWorld new.
	self assert: e stack isCollection.
	self assert: e stack isEmpty.