tests
testAfterLoop
	| p w |
	w := SMicroWorld new.
	p := SProcess microworld: w program: SProgram new.
	w clearRaisedEvents.
	p afterLoop.
	self assert: p privTransition equals: #afterLoop.
	self assertCollection: p privRunningEvents equals: {SEventId loopEventNo}.
	w raiseEvent: 8.
	w raiseEvent: 9.
	p afterLoop.
	self assert: p privTransition equals: #afterLoop.
	self assert: (p privRunningEvents isKindOf: Set).
	self assert: p privRunningEvents size equals: 2.
	self assert: (p privRunningEvents includes: 8).
	self assert: (p privRunningEvents includes: 9).