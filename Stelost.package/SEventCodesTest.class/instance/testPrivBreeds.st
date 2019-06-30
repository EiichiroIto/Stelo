tests-private
testPrivBreeds
	| c |
	c := SEventCodes new.
	self assert: c privBreeds isDictionary.
	self assert: c privBreeds isEmpty.