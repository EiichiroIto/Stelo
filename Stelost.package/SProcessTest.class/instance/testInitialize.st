tests
testInitialize
	| p |
	p := SProcess microworld: SMicroWorld new program: SProgram new.
	self assert: p privTransition equals: #idle.