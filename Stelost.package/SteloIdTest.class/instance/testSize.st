tests-accessing
testSize
	| e |
	e := SteloId new.
	self assert: e size equals: e class reservedNo.
	e newNo.
	self assert: e size equals: e class reservedNo + 1.