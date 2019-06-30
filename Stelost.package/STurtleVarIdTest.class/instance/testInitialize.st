tests-initialization
testInitialize
	| v |
	v := STurtleVarId new.
	self assert: v privVarNames size equals: 6.
	self assert: (v includes: 'color').
	self assert: (v includes: 'alive').
	self assert: (v includes: 'x').
	self assert: (v includes: 'y').
	self assert: (v includes: 'heading').
	self assert: (v includes: 'penDown').