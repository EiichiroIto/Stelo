tests-enumerating
testLivingOnesDo
	| ts |
	ts := STurtles new breedId: SBreedId turtleBreedNo.
	ts clear.
	ts create: 5.
	self assert: ts count	equals: 5.
	ts livingOnesDo: [ :each | ts aliveAt: each put: false ].
	self assert: ts count	equals: 0.