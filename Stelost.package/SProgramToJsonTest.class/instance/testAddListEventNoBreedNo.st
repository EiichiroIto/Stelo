test
testAddListEventNoBreedNo
	| j d |
	j := SProgramToJson new.
	j addList: #(1 2 3) eventNo: 2 breedNo: 5.
	j addList: #(4 5 6) eventNo: 2 breedNo: 3.
	j addList: #(1) eventNo: 1 breedNo: 5.
	j addList: #(5 6) eventNo: 3 breedNo: 3.
	d := j breeds.
	self assert: d size equals: 2.
	self assert: (d at: 3) class equals: Dictionary.
	self assertCollection: ((d at: 3) at: 2) equals: #(4 5 6).
	self assertCollection: ((d at: 3) at: 3) equals: #(5 6).
	self assert: (d at: 5) class equals: Dictionary.
	self assertCollection: ((d at: 5) at: 2) equals: #(1 2 3).
	self assertCollection: ((d at: 5) at: 1) equals: #(1).
	self should: [ j addCode: #(7 8) eventNo: 2 breedNo: 3 ] raise: Error.