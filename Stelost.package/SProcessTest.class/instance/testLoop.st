tests-accessing
testLoop
	| p |
	p := SProcess microworld: SMicroWorld new program: SProgram new.
	p loop.
	self assert: p privTransition equals: #afterLoop.
	self assertCollection: p privRunningEvents equals: {SEventId loopEventNo}.