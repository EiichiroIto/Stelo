tests-accessing
testUpdateVarId
	| v varId1 varId2 |
	varId1 := SVarId new.
	varId1 add: 'a'.
	varId1 add: 'b'.
	varId1 add: 'c'.
	v := SVariables new.
	v updateVarId: varId1.
	self assertCollection: v privVarNames asArray equals: #('a' 'b' 'c').
	self assert: v privVars isArray.
	self assert: v privVars size equals: 3.
	self assert: (v privVars at: 1) isEmpty.
	self assert: (v privVars at: 2) isEmpty.
	self assert: (v privVars at: 3) isEmpty.
	v privVars at: 1 put: #(0 0 0).
	v privVars at: 2 put: #(1 2 3).
	v privVars at: 3 put: #(4 5 6).
	varId2 := SVarId new.
	varId2 add: 'c'.
	varId2 add: 'b'.
	varId2 add: 'd'.
	v updateVarId: varId2.
	self assertCollection: v privVarNames asArray equals: #('c' 'b' 'd').
	self assert: v privVars isArray.
	self assert: v privVars size equals: 3.
	self assert: (v privVars at: 1) equals: #(4 5 6).
	self assert: (v privVars at: 2) equals: #(1 2 3).
	self assert: (v privVars at: 3) equals: #(0 0 0) asFloatArray.