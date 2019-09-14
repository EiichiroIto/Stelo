tests-observer ops
testClearAll
	| w e |
	w := self newWorld.
	w patches colorAtPoint: 10 @ 20 put: 1.
	w patches colorAtPoint: 20 @ 15 put: 2.
	w create: 3 turtles: 10.
	e := SThread sworld: w.
	self assert: e stack size equals: 0.
	self assert: (w patches colorAtPoint: 10 @ 20) equals: 1.
	self assert: (w patches colorAtPoint: 20 @ 15) equals: 2.
	self assert: (w breedOf: 3) countAlive equals: 10.
	e clearAll.
	self assert: e stack size equals: 0.
	self assert: (w patches colorAtPoint: 10 @ 20) equals: 0.
	self assert: (w patches colorAtPoint: 20 @ 15) equals: 0.
	self assert: (w breedOf: 3) countAlive equals: 0.