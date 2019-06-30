tests-execution
testStop
	| p |
	p := SProcess microworld: SMicroWorld new program: SProgram new.
	self assert: p privTransition equals: #idle.
	self assert: p privRunningEvents isEmpty.