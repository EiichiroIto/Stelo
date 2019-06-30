tests-testing
testIsRunning
	| p |
	p := SProcess microworld: SMicroWorld new program: SProgram new.
	p privTransition: #idle.
	self assert: p isRunning not.
	p privTransition: #loop.
	self assert: p isRunning.
	p privTransition: #setup.