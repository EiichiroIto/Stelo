tests-command
testCreate
	| ts |
	ts := STurtles new breedId: 3.
	self assert: ts count equals: 0.
	ts create: 10.
	self assert: ts count equals: 10.