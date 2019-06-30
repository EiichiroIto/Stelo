tests-private
testPrivEventCodes
	| p |
	p := SProgram new.
	self assert: p privEventCodes isDictionary.
	self assert: p privEventCodes isEmpty.