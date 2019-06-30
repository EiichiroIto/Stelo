tests-accessing
testVarFor
	| v |
	v := SVarId new.
	v add: 'abc'.
	v add: 'def'.
	v add: 'ghi'.
	self assert: (v varNoFor: 'abc') equals: 1.
	self assert: (v varNoFor: 'def') equals: 2.
	self assert: (v varNoFor: 'ghi') equals: 3.
	self should: [v varNoFor: 'aaa'] raise: NotFound.
	self should: [v varNoFor: 'bbb'] raise: NotFound.