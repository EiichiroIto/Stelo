tests-accessing
testEvaluate
	| w t c x |
	w := self newWorld.
	t := SThread sworld: w.
	w create: 3 turtles: 1.
	w var: SVarId colorVarNo breed: 3 at: 1 put: SColorList black.
	c := #(push1 pushShort 2 0 #plus #stop).
	t forBreedNo: 3 index: 1.
	t codes: c.
	x := t evaluate: 1.
	self assert: x equals: 3.