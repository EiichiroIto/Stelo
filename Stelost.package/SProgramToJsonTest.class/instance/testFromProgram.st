test
testFromProgram
	| p j ret |
	p := SProgram new.
	p addCode: #(1 2 3 4 5 6 7 8 9).
	p addEntryPoint: 10 eventNo: 1 breedNo: 1.
	p addEntryPoint: 12 eventNo: 1 breedNo: 2.
	p addEntryPoint: 14 eventNo: 1 breedNo: 2.
	p addEntryPoint: 16 eventNo: 2 breedNo: 1.
	j := SProgramToJson new.
	ret := j fromProgram: p.
	self assert: ret equals: '{"breeds":[{"breed":1,"entries":[{"event":1,"address":10},{"event":2,"address":16}]},{"breed":2,"entries":[{"event":1,"address":12},{"event":1,"address":14}]}],"codes":[1,2,3,4,5,6,7,8,9]}'