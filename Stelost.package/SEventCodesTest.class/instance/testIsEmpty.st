tests-testing
testIsEmpty
	| c |
	c := SEventCodes new.
	self assert: c isEmpty.
	c addCodes: #(1 2 3) forBreedNo: 1.
	self deny: c isEmpty.