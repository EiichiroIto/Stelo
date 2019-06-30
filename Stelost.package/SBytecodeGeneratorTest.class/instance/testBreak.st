tests-misc ops
testBreak
	| w b t |
	w := SMicroWorld new.
	b := SBytecodeGenerator new.
	b break.
	t := SThread microworld: w.
	self should: [ t execute: b code ] raise: Halt.