tests-accessing
testEvaluate
	| w t c x |
	w := SMicroWorld new.
	t := SThread microworld: w.
	w create: 3 turtles: 1.
	w var: SVarId colorVarNo breedNo: 3 at: 1 put: SColorList black.
	c := #(1 2 #plus).
	t forBreedNo: 3 index: 1.
	x := t evaluate: c.
	self assert: x equals: 3.