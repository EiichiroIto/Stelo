tests-accessing
testColorVarNo
	| v |
	v := SPatchVarId new.
	self assert: (v varNoFor: 'color') equals: SPatchVarId colorVarNo.