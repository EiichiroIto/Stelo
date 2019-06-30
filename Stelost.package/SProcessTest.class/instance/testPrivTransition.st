tests-private
testPrivTransition
	| p |
	p := SProcess microworld: SMicroWorld new program: SProgram new.
	self assert: p privTransition equals: #idle.
	p privTransition: #abc.
	self assert: p privTransition equals: #abc.