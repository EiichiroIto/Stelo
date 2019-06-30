tests-variable ops
testSetVarTo
	| w t v1 v2 |
	w := SMicroWorld new.
	t := SThread microworld: w.
	w create: 3 turtles: 1.
	t forBreedNo: 3 index: 1.
	v1 := (w breedsOf: 3) addVariable: 'a'.
	v2 := (w breedsOf: 3) addVariable: 'b'.
	self assert: (w var: v1 breedNo: 3 at: 1) equals: 0.
	self assert: (w var: v2 breedNo: 3 at: 1) equals: 0.
	self assert: t stack size equals: 0.
	t push: v1.
	t push: 123.
	t setVarTo.
	t push: v2.
	t push: 456.
	t setVarTo.
	self assert: (w var: v1 breedNo: 3 at: 1) equals: 123.
	self assert: (w var: v2 breedNo: 3 at: 1) equals: 456.
	self assert: t stack size equals: 0.