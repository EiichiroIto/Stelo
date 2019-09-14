initialization
initialize
	super initialize.
	parser := SteloBlockParser codeGenerator: self.
	bcGenerator := SBytecodeGenerator new.