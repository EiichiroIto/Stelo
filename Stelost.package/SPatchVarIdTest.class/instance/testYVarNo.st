tests-accessing
testYVarNo
	| v |
	v := SPatchVarId new.
	self assert: (v varNoFor: 'y') equals: SPatchVarId yVarNo.