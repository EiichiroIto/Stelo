tests-accessing
testUserDefinedVarNames
	| v |
	v := SVarId new.
	v add: 'x'.
	v add: 'y'.
	self assertCollection: v userDefinedVarNames asArray equals: #('x' 'y').
	v := STurtleVarId new.
	v add: 'x'.
	v add: 'y'.
	v add: 'z'.
	self assertCollection: v userDefinedVarNames asArray equals: #('z').