tests
testAfterSetup
	| p w |
	w := SMicroWorld new.
	p := SProcess microworld: w program: SProgram new.
	w clearRaisedEvents.
	p afterSetup.
	self assert: p privTransition equals: #idle.
	self assert: p privRunningEvents isEmpty.
	w raiseEvent: 8.
	w raiseEvent: 9.
	p afterSetup.
	self assert: p privTransition equals: #afterSetup.
	self assert: (p privRunningEvents isKindOf: Set).
	self assert: p privRunningEvents size equals: 2.
	self assert: (p privRunningEvents includes: 8).
	self assert: (p privRunningEvents includes: 9).