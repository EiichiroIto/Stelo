tests-accessing
testForObserver
	| e |
	e := SThread microworld: SMicroWorld new.
	self assert: e privBreedId isNil.
	self assert: e privId isNil.
	e forObserver.
	self assert: e privBreedId equals: SBreedId observerBreedNo.
	self assert: e privId equals: 1.