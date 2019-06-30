tests-adding
testAdd
	| v r |
	v := SVarId new.
	r := v add: 'abc'.
	self assert: r equals: 1.
	r := v add: 'def'.
	self assert: r equals: 2.
	r := v add: 'ghi'.
	self assert: r equals: 3.
	r := v add: 'def'.
	self assert: r equals: 2.
	self assertCollection: v privVarNames asArray equals: #('abc' 'def' 'ghi').