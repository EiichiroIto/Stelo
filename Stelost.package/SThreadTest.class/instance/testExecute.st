tests-accessing
testExecute
	| w t c x |
	w := SMicroWorld new.
	t := SThread microworld: w.
	w create: 3 turtles: 1.
	w var: SVarId colorVarNo breedNo: 3 at: 1 put: SColorList black.
	c := {SColorList white. #setColorTo}.
	t forBreedNo: 3 index: 1.
	t execute: c.
	x := w var: SVarId colorVarNo breedNo: 3 at: 1.
	self assert: x equals: SColorList white.