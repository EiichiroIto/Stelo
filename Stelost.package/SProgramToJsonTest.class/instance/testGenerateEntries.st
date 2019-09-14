test
testGenerateEntries
	| d j |
	d := Dictionary new.
	d at: 5 put: #(1).
	d at: 1 put: #(2 3).
	j := SProgramToJson new.
	j generateEntries: d.
	self assert: j stream contents equals: ',"entries":[{"event":1,"address":2},{"event":1,"address":3},{"event":5,"address":1}]'.