tests-private
testSetupTurtleAt
	| ts |
	ts := STurtles new breedNo: SBreedId turtleBreedNo.
	ts create: 3.
	ts setupTurtleAt: 1.
	ts setupTurtleAt: 2.
	ts setupTurtleAt: 3.
	self assert: (ts aliveAt: 1).
	self assert: (ts aliveAt: 2).
	self assert: (ts aliveAt: 3).
	self deny: (ts penDownAt: 1).
	self deny: (ts penDownAt: 2).
	self deny: (ts penDownAt: 3).