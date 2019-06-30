tests-accessing
testBreedsCount
	| w |
	w := SMicroWorld new.
	self assert: w breedsCount equals: 3.
	5 timesRepeat: [ w newBreed ].
	self assert: w breedsCount equals: 8