tests-initialization
testInitialize
	| br |
	br := SBreed new.
	self assert: br varId class equals: SVarId.
	self assert: br privVariables class equals: SVariables.