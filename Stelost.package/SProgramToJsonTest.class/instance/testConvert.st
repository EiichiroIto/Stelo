test
testConvert
	| pr j list |
	pr := SProgram new.
	pr addEntryPoint: 5 eventNo: SEventId loopEventNo breedNo: 3.
	pr addEntryPoint: 10 eventNo: SEventId loopEventNo breedNo: 1.
	j := SProgramToJson new.
	j convert: pr.
	self assert: j breeds size equals: 2.
	self assert: (j breeds at: 3) class equals: Dictionary.
	list := (j breeds at: 3) at: SEventId loopEventNo.
	self assertCollection: list asArray equals: #(5).
	self assert: (j breeds at: 1) class equals: Dictionary.
	list := (j breeds at: 1) at: SEventId loopEventNo.
	self assertCollection: list asArray equals: #(10).