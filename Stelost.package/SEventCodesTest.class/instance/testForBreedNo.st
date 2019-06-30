tests-accessing
testForBreedNo
	| c l |
	c := SEventCodes new.
	c addCodes: #(1 2 3) forBreedNo: 1.
	c addCodes: #(4 5 6) forBreedNo: 2.
	c addCodes: #(7 8 9) forBreedNo: 3.
	c addCodes: #(10 11) forBreedNo: 2.
	l := c forBreedNo: 1.
	self assert: l isCollection.
	self assert: l size equals: 1.
	self assertCollection: l first equals: #(1 2 3).
	l := c forBreedNo: 2.
	self assert: l isCollection.
	self assert: l size equals: 2.
	self assertCollection: l first equals: #(4 5 6).
	self assertCollection: l second equals: #(10 11).
	l := c forBreedNo: 3.
	self assert: l isCollection.
	self assert: l size equals: 1.
	self assertCollection: l first equals: #(7 8 9).