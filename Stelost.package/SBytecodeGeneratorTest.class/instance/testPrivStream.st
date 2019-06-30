tests-private
testPrivStream
	| b |
	b := SBytecodeGenerator new.
	self assert: b privStream isStream.
	self assert: b privStream contents isArray.