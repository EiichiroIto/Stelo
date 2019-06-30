tests-private
testVarId
	| obj |
	obj := STurtles new.
	self assert: obj varId class equals: STurtleVarId.
	obj := SPatches new.
	self assert: obj varId class equals: SPatchVarId