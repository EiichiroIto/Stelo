code generator
emitCode
	hats do: 
		[:each | 
		self emitCodeHat: each.
		codeGenerator generateLineFeed]