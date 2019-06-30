tests-testing
testIsReservedVar
	| v |
	v := SPatchVarId new.
	v add: 'a'.
	self assert: (v isReservedVar: 'x').
	self assert: (v isReservedVar: 'y').
	self deny: (v isReservedVar: 'a').
	self assert: (v isReservedVar: 'color').
	self assert: (v isReservedVar: 'screen').