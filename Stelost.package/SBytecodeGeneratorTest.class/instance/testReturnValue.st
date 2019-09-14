tests-control ops
testReturnValue
	| b r |
	b := SBytecodeGenerator new.
	b returnValue.
	b address: 5.
	r := b code.
	self assertCollection: r equals: #(returnValue stop).