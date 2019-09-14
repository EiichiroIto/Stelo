tests-accessing
testAddress
	| b |
	b := SBytecodeGenerator new.
	self assert: b address equals: 1.
	b address: 100.
	self assert: b address equals: 100.