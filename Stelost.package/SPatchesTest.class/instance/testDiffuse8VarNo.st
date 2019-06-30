tests-command
testDiffuse8VarNo
	| ps v |
	ps := SPatches new.
	ps create: 3.
	v := ps addVariable: 'a'.
	ps var: v at: 5 put: 100.
	self
		assertCollection: (ps privVariables arrayOfVarNo: v)
		equals: #(0 0 0 0 100 0 0 0 0) asFloatArray.
	ps diffuse8: 80 varNo: v.
	self
		assertCollection: (ps privVariables arrayOfVarNo: v)
		equals: #(10 10 10 10 20 10 10 10 10) asFloatArray