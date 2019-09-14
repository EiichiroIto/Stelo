tests-private
testPrivSWorld
	| w1 w2 e |
	w1 := SMicroWorld new.
	e := SThread sworld: w1.
	self assert: e privSWorld equals: w1.
	w2 := SMicroWorld new.
	e privSWorld: w2.
	self assert: e privSWorld equals: w2.