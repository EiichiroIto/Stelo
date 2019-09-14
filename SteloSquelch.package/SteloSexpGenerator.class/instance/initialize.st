initialization
initialize
	super initialize.
	parser := SteloBlockParser codeGenerator: self.
	stream := WriteStream on: String new.