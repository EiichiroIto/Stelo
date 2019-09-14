test
testBreeds
	| j |
	j := SProgramToJson new.
	self assert: j breeds class equals: Dictionary.