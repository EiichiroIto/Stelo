tests-variable ops
testGetBreedId
	| w t |
	w := SMicroWorld new.
	w createPatchOrder: 3.
	w create: 3 turtles: 2.

	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t getBreedId.
	self assert: t pop equals: 3.

	t := SThread microworld: w.
	t forBreedNo: 3 index: 2.
	t getBreedId.
	self assert: t pop equals: 3.

	t := SThread microworld: w.
	t forPatchId: 3.
	t getBreedId.
	self assert: t pop equals: 2.

	t := SThread microworld: w.
	t forObserver.
	t getBreedId.
	self assert: t pop equals: 1.