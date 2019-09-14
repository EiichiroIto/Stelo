test
testUserDefinedVarNoAndNames
	| v |
	v := STurtleVarId new.
	v add: 'x'.
	v add: 'b'.
	v add: 'a'.
	self
		assertCollection: v userDefinedVarNoAndNames asArray
		equals: #(#(6 'b') #(7 'a')).
	v := SPatchVarId new.
	v add: 'x'.
	v add: 'b'.
	v add: 'a'.
	self
		assertCollection: v userDefinedVarNoAndNames asArray
		equals: #(#(5 'b') #(6 'a'))