tests-private
testPrivMicroworld
	| w p |
	w := SMicroWorld new.
	p := SProcess microworld: w program: SProgram new.
	self assert: p privMicroworld equals: w.