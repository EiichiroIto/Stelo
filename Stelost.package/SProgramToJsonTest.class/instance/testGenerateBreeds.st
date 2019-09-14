test
testGenerateBreeds
	| d d1 d2 j |
	d := Dictionary new.
	d1 := Dictionary new.
	d1 at: 5 put: #(2).
	d2 := Dictionary new.	
	d2 at: 1 put: #(4 5).
	d at: 3 put: d1.
	d at: 2 put: d2.
	j := SProgramToJson new.
	j generateBreeds: d.
	self assert: j stream contents equals: '"breeds":[{"breed":2,"entries":[{"event":1,"address":4},{"event":1,"address":5}]},{"breed":3,"entries":[{"event":5,"address":2}]}]'