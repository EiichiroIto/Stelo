tests-accessing
testSubTable
	| b d |
	b := SBytecodeGenerator new.
	self assert: b subTable isNil.
	d := Dictionary new.
	b subTable: d.
	self assert: b subTable equals: d.