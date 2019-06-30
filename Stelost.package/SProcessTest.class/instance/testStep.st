tests-accessing
testStep
	| p |
	p := SProcess microworld: SMicroWorld new program: SProgram new.
	p privTransition: #idle.
	p step.