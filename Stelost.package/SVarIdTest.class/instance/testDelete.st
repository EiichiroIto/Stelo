tests-accessing
testDelete
	| v |
	v := SVarId new.
	v add: 'abc'.
	v add: 'def'.
	v add: 'ghi'.
	self assertCollection: v privVarNames asArray equals: #('abc' 'def' 'ghi').
	v delete: 'abc'.
	self assertCollection: v privVarNames asArray equals: #('def' 'ghi').
	v := SPatchVarId new.
	v add: 'abc'.
	v add: 'def'.
	v add: 'ghi'.
	self should: [v delete: 'x'] raise: Error.