tests
testInitialize
	| v |
	v := SVarId new.
	self assertCollection: v varNames equals: #().
	v := SPatchVarId new.
	self assertCollection: v varNames equals: #(color screen x y).
	v := STurtleVarId new.
	self assertCollection: v varNames equals: #(color alive x y heading penDown).