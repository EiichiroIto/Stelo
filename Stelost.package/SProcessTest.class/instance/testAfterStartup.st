tests
testAfterStartup
	| p w |
	w := SMicroWorld new.
	p := SProcess microworld: w program: SProgram new.
	w clearRaisedEvents.
	p afterStartup.
	self assert: p privTransition equals: #afterSetup.
	self assertCollection: p privRunningEvents equals: {SEventId setupEventNo}.
	w raiseEvent: 8.
	w raiseEvent: 9.
	p afterStartup.
	self assert: p privTransition equals: #afterStartup.
	self assert: (p privRunningEvents isKindOf: Set).
	self assert: p privRunningEvents size equals: 2.
	self assert: (p privRunningEvents includes: 8).
	self assert: (p privRunningEvents includes: 9).