tests-accessing
testSingle
	| p |
	p := SProcess microworld: SMicroWorld new program: SProgram new.
	p single.
	self assert: p privTransition equals: #afterSingle.
	self assertCollection: p privRunningEvents equals: {SEventId singleEventNo}.