tests-accessing
testBreedsOf
	| w |
	w := SMicroWorld new.
	self assert: (w breedsOf: 3) class equals: STurtles.