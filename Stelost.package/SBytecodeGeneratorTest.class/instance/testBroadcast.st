tests-misc ops
testBroadcast
	| w b t e eventId |
	w := SMicroWorld new.
	w create: 3 turtles: 1.
	eventId := SEventId new.
	e := eventId newNo.
	b := SBytecodeGenerator new.
	b broadcast: e.
	self assert: w raisedEvents isEmpty.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t execute: b code.
	self assert: (w raisedEvents includes: e).