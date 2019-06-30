tests-execution
testIdle
	| p |
	p := SProcess microworld: SMicroWorld new program: SProgram new.
	p idle.