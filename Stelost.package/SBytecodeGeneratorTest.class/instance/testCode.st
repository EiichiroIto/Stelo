tests-accessing
testCode
	| b arr |
	b := SBytecodeGenerator new.
	b forward: 1.
	b turn: 15.
	arr := b code.
	self assertCollection: arr equals: #(push1 forward pushShort 15 0 pushShort 5 0 getVar plus setHeading stop).