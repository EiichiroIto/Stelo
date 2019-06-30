tests-command
testClear
	| ps cs v |
	ps := SPatches new.
	ps create: 3.
	cs := ps privVariables arrayOfVarNo: SPatchVarId colorVarNo.
	1 to: 9 do: [ :each | cs at: each put: each ].
	v := ps addVariable: 'a'.
	1 to: 9 do: [ :each | ps var: v at: each put: 5 ].
	self assertCollection: cs class equals: ByteArray.
	self assertCollection: cs asArray equals: #(1 2 3 4 5 6 7 8 9).
	self
		assertCollection: (ps privVariables arrayOfVarNo: v)
		equals: #(5 5 5 5 5 5 5 5 5) asFloatArray.
	ps clear.
	self assertCollection: cs asArray equals: #(0 0 0 0 0 0 0 0 0).
	self
		assertCollection: (ps privVariables arrayOfVarNo: v)
		equals: #(0 0 0 0 0 0 0 0 0) asFloatArray