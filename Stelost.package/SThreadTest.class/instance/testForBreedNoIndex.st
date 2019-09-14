tests-accessing
testForBreedNoIndex
	| e |
	e := SThread sworld: SMicroWorld new.
	self assert: e privBreedId isNil.
	self assert: e privId isNil.
	e forBreedNo: 3 index: 123.
	self assert: e privBreedId equals: 3.
	self assert: e privId equals: 123.