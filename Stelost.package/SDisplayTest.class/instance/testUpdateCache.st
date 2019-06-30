tests-accessing
testUpdateCache
	| d w |
	w := SMicroWorld new.
	d := SDisplay microworld: w.
	self assert: d extent equals: 220 @ 220.
	self assert: w extent equals: 100 @ 100.
	d updateCache.
	self assert: d privCell equals: 2 @ 2.
	self assert: d privOffset equals: 10 @ 10.
	d extent: 150 @ 120.
	d updateCache.
	self assert: d privCell equals: 1 @ 1.
	self assert: d privOffset equals: 25 @ 10.