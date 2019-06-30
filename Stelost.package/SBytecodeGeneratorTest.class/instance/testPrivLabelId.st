tests-private
testPrivLabelId
	| b |
	b := SBytecodeGenerator new.
	self assert: b privLabelId class equals: SteloId.
	self assert: b privLabelId size equals: 0.