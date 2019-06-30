tests-private
testPrivMicroworld
	| w1 w2 e |
	w1 := SMicroWorld new.
	e := SThread microworld: w1.
	self assert: e privMicroworld equals: w1.
	w2 := SMicroWorld new.
	e privMicroworld: w2.
	self assert: e privMicroworld equals: w2.