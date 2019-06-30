tests-accessing
testStack
	| e |
	e := SThread microworld: SMicroWorld new.
	self assert: e stack isCollection.
	self assert: e stack isEmpty.