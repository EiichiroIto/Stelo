tests-accessing
testIsDied
	| p |
	p := SMicroWorld new.
	self assert: p isDied not.