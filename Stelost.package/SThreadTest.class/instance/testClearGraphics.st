tests-observer ops
testClearGraphics
	| w e |
	w := self newWorld.
	w patches colorAtPoint: 10 @ 20 put: 1.
	w patches colorAtPoint: 20 @ 15 put: 2.
	e := SThread sworld: w.
	self assert: e stack size equals: 0.
	self assert: (w patches colorAtPoint: 10 @ 20) equals: 1.
	self assert: (w patches colorAtPoint: 20 @ 15) equals: 2.
	e clearGraphics.
	self assert: e stack size equals: 0.
	self assert: (w patches colorAtPoint: 10 @ 20) equals: 0.
	self assert: (w patches colorAtPoint: 20 @ 15) equals: 0.