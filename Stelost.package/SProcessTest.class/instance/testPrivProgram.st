tests-private
testPrivProgram
	| pr p |
	pr := SProgram new.
	p := SProcess microworld: SMicroWorld new program: pr.
	self assert: p privProgram equals: pr.