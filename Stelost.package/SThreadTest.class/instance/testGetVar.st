tests-variable ops
testGetVar
	| w t v |
	w := SMicroWorld new.
	t := SThread microworld: w.
	w create: 3 turtles: 1.
	t forBreedNo: 3 index: 1.
	v := (w breedsOf: 3) addVariable: 'b'.
	t push: v.
	t getVar.
	self assert: t pop equals: 0.
	w
		var: v
		breedNo: 3
		at: 1
		put: 10.
	t push: v.
	t getVar.
	self assert: t pop equals: 10