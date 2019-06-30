private
appendSymbol: aSymbol withJump: anInteger
	stream nextPut: (SCodeSymbolWithJump selector: aSymbol labelId: anInteger).