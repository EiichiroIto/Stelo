tests-private
testPrivVariables
	| obj |
	obj := STurtles new.
	self assert: obj privVariables class equals: SVariables.
	obj := SPatches new.
	self assert: obj privVariables class equals: SVariables