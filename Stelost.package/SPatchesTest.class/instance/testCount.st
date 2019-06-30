tests-accessing
testCount
	| ps |
	ps := SPatches new.
	ps create: 5.
	self assert: ps count equals: 25.
	ps create: 10.
	self assert: ps count equals: 100.