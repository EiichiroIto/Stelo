test
testGenerateEntryEventNo
	| j |
	j := SProgramToJson new.
	j generateEntry: #() eventNo: 5.
	self assert: j stream contents equals: ''.
	j := SProgramToJson new.
	j generateEntry: #(1) eventNo: 5.
	self assert: j stream contents equals: '{"event":5,"address":1}'.
	j := SProgramToJson new.
	j generateEntry: #(3 4) eventNo: 1.
	self
		assert: j stream contents
		equals: '{"event":1,"address":3},{"event":1,"address":4}'.
	j := SProgramToJson new.
	j generateEntry: #(5 6 7) eventNo: 3.
	self
		assert: j stream contents
		equals:
			'{"event":3,"address":5},{"event":3,"address":6},{"event":3,"address":7}'