tests-testing
testIncludes
	| v |
	v := SVarId new.
	v add: 'abc'.
	v add: 'def'.
	v add: 'ghi'.
	self assert: (v includes: 'abc').
	self assert: (v includes: 'def').
	self assert: (v includes: 'ghi').
	self assert: (v includes: 'aaa') not.
	self assert: (v includes: 'bbb') not.