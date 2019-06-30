tests-accessing
testScreenVarNo
	| v |
	v := SPatchVarId new.
	self assert: (v varNoFor: 'screen') equals: SPatchVarId screenVarNo.