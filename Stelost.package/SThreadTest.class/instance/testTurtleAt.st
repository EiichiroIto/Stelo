tests-turtle ops
testTurtleAt
	| w t ret |
	w := SMicroWorld new.
	t := SThread microworld: w.
	w create: 3 turtles: 2.
	t forBreedNo: 3 index: 0.
	self assert: t stack size equals: 0.
	t push: 0.
	t push: 0.
	t push: 3.
	t turtleAt.
	ret := t pop.
	self assert: (ret = 1 or: [ ret = 2 ]).
	self assert: t stack size equals: 0.
	t forBreedNo: 3 index: 1.
	self assert: t stack size equals: 0.
	t push: 0.
	t push: 0.
	t push: 3.
	t turtleAt.
	ret := t pop.
	self assert: ret equals: 2.
	self assert: t stack size equals: 0.
	t forBreedNo: 3 index: 2.
	self assert: t stack size equals: 0.
	t push: 0.
	t push: 0.
	t push: 3.
	t turtleAt.
	ret := t pop.
	self assert: ret equals: 1.
	self assert: t stack size equals: 0.