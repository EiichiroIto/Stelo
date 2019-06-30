tests-accessing
testSelector
	| c |
	c := SCodeSymbol selector: #abc.
	self assert: c selector equals: #abc.
	c selector: #def.
	self assert: c selector equals: #def.