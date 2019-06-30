tests-private
testVarNames
	| v |
	v := SVarId new.
	self assert: v varNames isEmpty.
	v add: 'x'.
	v add: 'y'.
	self assertCollection: v varNames equals: #('x' 'y').