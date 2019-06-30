tests-color ops
testSetColorTo
	| w t ret |
	w := SMicroWorld new.
	w create: 3 turtles: 2.

	t := SThread microworld: w.
	t forBreedNo: 3 index: 1.
	t push: 10.
	t setColorTo.

	t := SThread microworld: w.
	t forBreedNo: 3 index: 2.
	t push: 15.
	t setColorTo.

	t := SThread microworld: w.
	t forPatchId: 1.
	t push: 20.
	t setColorTo.

	ret := w var: SVarId colorVarNo breedNo: 3 at: 1.
	self assert: ret equals: 10.
	ret := w var: SVarId colorVarNo breedNo: 3 at: 2.
	self assert: ret equals: 15.
	ret := w var: SVarId colorVarNo breedNo: 2 at: 1.
	self assert: ret equals: 20.