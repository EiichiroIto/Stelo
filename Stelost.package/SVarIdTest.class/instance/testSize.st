tests-accessing
testSize
	| v |
	v := SVarId new.
	v add: 'x'.
	self assert: v size equals: 1.
	v add: 'y'.
	self assert: v size equals: 2.