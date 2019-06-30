tests-accessing
testVarAt
	| vid var v |
	vid := SVarId new.
	v := vid add: 'a'.
	var := SVariables new.
	var updateVarId: vid.
	var forceSize: 2.
	self assert: (var var: v at: 1) equals: 0.
	(var arrayOfVarNo: v) at: 1 put: 1.
	(var arrayOfVarNo: v) at: 2 put: 5.
	self assert: (var var: v at: 1) equals: 1.
	self assert: (var var: v at: 2) equals: 5.