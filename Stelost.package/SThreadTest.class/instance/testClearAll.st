tests-observer ops
testClearAll
	| w e |
	w := SMicroWorld new.
	w patches colorAtPoint: 10 @ 20 put: 1.
	w patches colorAtPoint: 20 @ 15 put: 2.
	w create: 3 turtles: 10.
	e := SThread microworld: w.
	self assert: e stack size equals: 0.
	self assert: (w patches colorAtPoint: 10 @ 20) equals: 1.
	self assert: (w patches colorAtPoint: 20 @ 15) equals: 2.
	self assert: (w breedsOf: 3) count equals: 10.
	e clearAll.
	self assert: e stack size equals: 0.
	self assert: (w patches colorAtPoint: 10 @ 20) equals: 0.
	self assert: (w patches colorAtPoint: 20 @ 15) equals: 0.
	self assert: (w breedsOf: 3) count equals: 0.