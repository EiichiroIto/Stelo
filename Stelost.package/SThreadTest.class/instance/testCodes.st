tests-accessing
testCodes
	| t |
	t := SThread microworld: SMicroWorld new.
	self assert: t codes isNil.
	t codes: #(1 2 3).
	self assertCollection: t codes equals: #(1 2 3).