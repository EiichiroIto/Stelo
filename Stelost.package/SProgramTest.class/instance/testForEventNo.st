tests-accessing
testForEventNo
	| p c1 c2 |
	p := SProgram new.
	self assert: p privEventCodes isEmpty.
	c1 := p forEventNo: 1.
	self assert: (c1 isKindOf: SEventCodes).
	self assert: p privEventCodes size equals: 1.
	self assert: (p privEventCodes at: 1) equals: c1.
	c2 := p forEventNo: 2.
	self assert: (c2 isKindOf: SEventCodes).
	self assert: p privEventCodes size equals: 2.
	self assert: (p privEventCodes at: 2) equals: c2.
	self assert: c1 ~= c2.