tests-accessing
testElementSize
	| v varId |
	varId := SVarId new.
	varId add: 'x'.
	v := SVariables new.
	v updateVarId: varId.
	self assert: v elementSize equals: 0.
	v privAt: 1 put: #(1 2 3 4 5).
	self assert: v elementSize equals: 5.