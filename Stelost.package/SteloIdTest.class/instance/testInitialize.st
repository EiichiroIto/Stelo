tests-initialization
testInitialize
	| e |
	e := SteloId new.
	self assert: e privNextNo equals: e class defaultUserNo.