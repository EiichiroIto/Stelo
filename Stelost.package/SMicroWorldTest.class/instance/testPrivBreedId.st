tests-private
testPrivBreedId
	| w |
	w := SMicroWorld new.
	self assert: w privBreedId class equals: SBreedId.