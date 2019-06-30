tests-private
testIndexAtRowCol
	| ps |
	ps := SPatches new.
	self assert: ps cols equals: 100.
	self assert: (ps indexAtRow: 1 col: 1) equals: 1.
	self assert: (ps indexAtRow: 1 col: 2) equals: 101.
	self assert: (ps indexAtRow: 100 col: 1) equals: 100.
	self assert: (ps indexAtRow: 2 col: 1) equals: 2.
	self assert: (ps indexAtRow: 100 col: 100) equals: 10000.