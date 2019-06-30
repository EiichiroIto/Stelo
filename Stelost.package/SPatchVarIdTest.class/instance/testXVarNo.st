tests-accessing
testXVarNo
	| v |
	v := SPatchVarId new.
	self assert: (v varNoFor: 'x') equals: SPatchVarId xVarNo.