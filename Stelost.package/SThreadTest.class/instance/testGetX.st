tests-variable ops
testGetX
	| w t |
	w := SMicroWorld new.
	w createPatchOrder: 3.
	w create: 3 turtles: 3.
	w x: 3 at: 1 put: 1.
	w x: 3 at: 2 put: -1.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t getX.
	self assert: t pop equals: 1.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 2.
	t getX.
	self assert: t pop equals: -1.
	t := SThread microworld: w.
	t forBreedNo: 3 index: 3.
	t getX.
	self assert: t pop equals: 0.
	t := SThread microworld: w.
	t forPatchId: 3.
	t getX.
	self assert: t pop equals: 1