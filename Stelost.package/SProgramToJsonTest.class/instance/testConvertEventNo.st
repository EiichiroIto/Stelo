test
testConvertEventNo
	| e j d |
	e := SEntryPoints new.
	e addEntryPoint: 1 forBreedNo: 5.
	e addEntryPoint: 2 forBreedNo: 5.
	e addEntryPoint: 9 forBreedNo: 3.
	j := SProgramToJson new.
	j convert: e eventNo: 2.
	d := j breeds.
	self assert: d size equals: 2.
	self assert: (d at: 3) class equals: Dictionary.
	self assertCollection: ((d at: 3) at: 2) asArray equals: #(9).
	self assert: (d at: 5) class equals: Dictionary.
	self assertCollection: ((d at: 5) at: 2) asArray equals: #(1 2).