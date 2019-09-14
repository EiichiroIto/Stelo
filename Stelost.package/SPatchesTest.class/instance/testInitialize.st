tests-initialization
testInitialize
	| ps |
	ps := SPatches new.
	self assert: ps varId class equals: SPatchVarId.
	self assert: ps privVariables class equals: SVariables.
	self assert: ps size equals: 10000.