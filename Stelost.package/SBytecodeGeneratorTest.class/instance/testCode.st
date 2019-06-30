tests-accessing
testCode
	| b arr |
	b := SBytecodeGenerator new.
	b forward: 1.
	b turn: 15.
	arr := b code.
	self assertCollection: arr equals: #(1 forward 15 5 getVar plus setHeading).