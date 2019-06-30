tests
testCountOfBreedNo
	| w |
	w := SMicroWorld new.
	w create: 3 turtles: 10.
	w newBreed.
	w create: 4 turtles: 15.
	self assert: (w countOfBreedNo: 3) equals: 10.
	self assert: (w countOfBreedNo: 4) equals: 15.
	w createPatchOrder: 10.
	self assert: (w countOfBreedNo: 2) equals: 100.