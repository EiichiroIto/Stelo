test
testGenerateCodes
	| j |
	j := SProgramToJson new.
	j generateCodes: #().
	self assert: j stream contents equals: '"codes":[]'.
	j := SProgramToJson new.
	j generateCodes: #(1).
	self assert: j stream contents equals: '"codes":[1]'.
	j := SProgramToJson new.
	j generateCodes: #(1 2).
	self assert: j stream contents equals: '"codes":[1,2]'.
	j := SProgramToJson new.
	j generateCodes: #(1 2 3 4).
	self assert: j stream contents equals: '"codes":[1,2,3,4]'.