tests-accessing
testPatches
	| w |
	w := SMicroWorld new.
	self assert: w patches class equals: SPatches.