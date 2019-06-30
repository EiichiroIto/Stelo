tests
testAfterSingle
	| p w |
	w := SMicroWorld new.
	p := SProcess microworld: w program: SProgram new.
	w clearRaisedEvents.
	p afterSingle.
	self assert: p privTransition equals: #idle.
	self assert: p privRunningEvents isEmpty.
	w raiseEvent: 8.
	w raiseEvent: 9.
	p afterSingle.
	self assert: p privTransition equals: #afterSingle.
	self assert: (p privRunningEvents isKindOf: Set).
	self assert: p privRunningEvents size equals: 2.
	self assert: (p privRunningEvents includes: 8).
	self assert: (p privRunningEvents includes: 9).