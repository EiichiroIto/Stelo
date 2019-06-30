tests-private
testPrivNextNo
	| e |
	e := SteloId new.
	e privNextNo: 10.
	self assert: e privNextNo equals: 10.
	e privNextNo: 20.
	self assert: e privNextNo equals: 20.