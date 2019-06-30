tests-accessing
testSetup
	| p |
	p := SProcess microworld: SMicroWorld new program: SProgram new.
	p setup.
	self assert: p privTransition equals: #afterSetup.
	self assertCollection: p privRunningEvents equals: {SEventId setupEventNo}.