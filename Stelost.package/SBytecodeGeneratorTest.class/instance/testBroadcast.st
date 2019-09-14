tests-misc ops
testBroadcast
	| w b t e eventId |
	w := self newWorld.
	w create: 3 turtles: 1.
	eventId := SEventId new.
	e := eventId newNo.
	b := SBytecodeGenerator new.
	b broadcast: e.
	self assert: w raisedEvents isEmpty.
	t := SThread sworld: w.
	t forBreedNo: 3 index: 1.
	t codes: b code.
	t execute: 1.
	self assert: (w raisedEvents includes: e).