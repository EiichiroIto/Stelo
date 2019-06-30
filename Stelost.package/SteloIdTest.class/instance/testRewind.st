tests-accessing
testRewind
	| s |
	s := SteloId new.
	self assert: s size equals: 0.
	5 timesRepeat: [s newNo].
	self assert: s size equals: 5.
	s rewind.
	self assert: s size equals: 0.