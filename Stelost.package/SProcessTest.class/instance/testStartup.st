tests-accessing
testStartup
	| p |
	p := SProcess microworld: SMicroWorld new program: SProgram new.
	p startup.
	self assert: p privTransition equals: #afterStartup.
	self assertCollection: p privRunningEvents equals: {SEventId startupEventNo}.