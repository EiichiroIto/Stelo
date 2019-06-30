tests-accessing
testExtent
	| w |
	w := SMicroWorld new.
	w createPatchOrder: 10.
	self assert: w extent equals: 10 @ 10.
	w createPatchOrder: 20.
	self assert: w extent equals: 20 @ 20.